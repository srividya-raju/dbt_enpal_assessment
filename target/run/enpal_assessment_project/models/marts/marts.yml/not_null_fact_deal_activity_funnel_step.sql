
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select funnel_step
from "postgres"."public_pipedrive_analytics"."fact_deal_activity"
where funnel_step is null



  
  
      
    ) dbt_internal_test