
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    dc.deal_id,
    dc.stage_id,
    dc.funnel_step,
    dc.kpi_name as int_kpi_name,
    s.stage_name as expected_stage_name
from "postgres"."public_pipedrive_intermediate"."int_deal_changes"  dc
left join "postgres"."public_pipedrive_staging"."stg_stages" s
    on lower(dc.kpi_name) = lower(s.stage_name)
where
     s.stage_name is null
  
  
      
    ) dbt_internal_test