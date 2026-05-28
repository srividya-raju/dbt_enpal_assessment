
  
    

  create  table "postgres"."public_pipedrive_analytics"."rep_sales_funnel_monthly__dbt_tmp"
  
  
    as
  
  (
    with monthly_counts as (
select  date_trunc('month', deal_change_time)::date as month,
    kpi_name,
    funnel_step, 
    coalesce(count(distinct deal_id), 0) as deal_count
from "postgres"."public_pipedrive_intermediate"."int_union_deals_activity"
group by date_trunc('month', deal_change_time)::date, funnel_step, kpi_name
order by month, funnel_step
)

select * from monthly_counts
  );
  