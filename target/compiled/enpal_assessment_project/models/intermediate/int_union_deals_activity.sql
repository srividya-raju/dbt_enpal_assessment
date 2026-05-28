with deals as (
select  deal_id,	
  change_time as deal_change_time,	
  funnel_step, 
  kpi_name
from "postgres"."public_pipedrive_intermediate"."int_deal_changes"

),
activities as (
select deal_id,	
  due_date as deal_change_time,	
  funnel_step, 
  kpi_name
from "postgres"."public_pipedrive_intermediate"."int_activity_filtered"

),
union_deals_activities as (
select * from deals 
union all
select * from activities
)   

select * 
from union_deals_activities
order by deal_id, funnel_step,deal_change_time asc