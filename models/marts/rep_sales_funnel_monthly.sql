with monthly_counts as (
select  date_trunc('month', deal_change_time)::date as month,
    kpi_name,
    funnel_step, 
    coalesce(count(distinct deal_id), 0) as deal_count
from {{ ref('int_union_deals_activity') }}
group by date_trunc('month', deal_change_time)::date, funnel_step, kpi_name
order by month, funnel_step
)

select * from monthly_counts