
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select is_completed
from "postgres"."public_pipedrive_staging"."stg_activity"
where is_completed is null



  
  
      
    ) dbt_internal_test