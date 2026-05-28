
  
    

  create  table "postgres"."public_pipedrive_analytics"."fact_deal_activity__dbt_tmp"
  
  
    as
  
  (
    with unioned as (
    select *
    from "postgres"."public_pipedrive_intermediate"."int_union_deals_activity" da
),
lost_deals as (
    select deal_id,
         change_time as deal_change_time,
         funnel_step, 
         kpi_name 
    from "postgres"."public_pipedrive_intermediate"."int_deals_lost" dl
),
fct_table as (
select * 
from unioned
union all
select * from lost_deals
)

select * 
from fct_table
order by deal_id, funnel_step,deal_change_time asc
  );
  