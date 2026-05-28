
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_activity__dbt_tmp"
  
  
    as
  
  (
    --This model is used to deduplicate the activity data based on the specified columns.
with deduped as (select
        *,
       row_number() over (partition by activity_id, activity_type,assigned_user_id,	deal_id,is_completed,due_date) as rn
    from  "postgres"."public_pipedrive_analytics"."stg_activity" 
)



select
  activity_id, 	deduped.activity_type,	assigned_user_id,	deal_id,	is_completed,	due_date,
  case deduped.activity_type
            when 'meeting' then 'Step 2.1' 
            when 'sc_2'    then 'Step 3.1'
        end                         as funnel_step,

        at.activity_type_name                      as kpi_name
from deduped
left join "postgres"."public_pipedrive_analytics"."stg_activity_types" at on deduped.activity_type = at.activity_type
where rn = 1
and deduped.activity_type in ('meeting', 'sc_2')
  );
  