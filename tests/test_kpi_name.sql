
select
    dc.deal_id,
    dc.stage_id,
    dc.funnel_step,
    dc.kpi_name as int_kpi_name,
    s.stage_name as expected_stage_name
from {{ ref('int_deal_changes') }}  dc
left join {{ ref('stg_stages') }} s
    on lower(dc.kpi_name) = lower(s.stage_name)
where
     s.stage_name is null
