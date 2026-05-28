
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select funnel_step
from "postgres"."public_pipedrive_intermediate"."int_activity_filtered"
where funnel_step is null



  
  
      
    ) dbt_internal_test