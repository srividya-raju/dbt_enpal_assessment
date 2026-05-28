
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select is_completed
from "postgres"."public_pipedrive_intermediate"."int_activity_filtered"
where is_completed is null



  
  
      
    ) dbt_internal_test