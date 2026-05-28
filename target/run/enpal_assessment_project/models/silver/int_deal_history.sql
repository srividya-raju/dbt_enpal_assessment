
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_deal_history__dbt_tmp"
  
  
    as
  
  (
    with stage_changes as (
    select
        deal_id,
        new_value::int              as stage_id,
        change_time                 as entered_at
    from "postgres"."public_pipedrive_analytics"."bronze_deal_changes"
    where changed_field_key = 'stage_id'
),

stages as (
    select * from "postgres"."public_pipedrive_analytics"."bronze_stages"
),

-- Derive exit time: next stage entry for the same deal
with_exit as (
    select
        deal_id,
        stage_id,
        entered_at,
        lead(entered_at) over (
            partition by deal_id
            order by entered_at
        )                           as exited_at
    from stage_changes
)

select
    w.deal_id,
    w.stage_id,
    s.stage_name,

    -- Canonical funnel step: stage_id maps 1:1 to funnel step in this dataset
    w.stage_id::text                as funnel_step,

    -- KPI name directly from the stages table
    s.stage_name                    as kpi_name,

    w.entered_at,
    w.exited_at,

    -- Time in stage (NULL if deal is still in this stage)
    extract(epoch from (
        coalesce(w.exited_at, current_timestamp) - w.entered_at
    )) / 86400.0                    as days_in_stage

from with_exit w
left join stages s on w.stage_id = s.stage_id
  );
  