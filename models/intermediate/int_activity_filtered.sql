--This model is used to deduplicate the activity data based on all columns using row_number() window function 
with deduped as (select
        *,
       row_number() over (partition by activity_id, activity_type,assigned_user_id,	deal_id,is_completed,due_date) as rn
    from  {{ ref('stg_activity') }} 
),
kpi_filtered_activity as (
select
  activity_id, 	
  deduped.activity_type,	
  assigned_user_id,	
  deal_id,	
  is_completed,	
  due_date,
  case deduped.activity_type
            when 'meeting' then 'Step 2.1' 
            when 'sc_2'    then 'Step 3.1'
        end                         as funnel_step,

  at.activity_type_name as kpi_name
from deduped
left join {{ ref('stg_activity_types') }} at on deduped.activity_type = at.activity_type
where rn = 1
and deduped.activity_type in ('meeting', 'sc_2')
),

unique_deals as (
    select *, 
    row_number() over (partition by deal_id order by due_date desc) as rn
    from kpi_filtered_activity
)

select activity_id,	
        assigned_user_id,
        deal_id,	
        is_completed,
        due_date,
        funnel_step,
        kpi_name
from unique_deals
where rn=1