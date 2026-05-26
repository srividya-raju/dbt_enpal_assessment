
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select changed_time
from "postgres"."public"."deal_changes"
where changed_time is null



  
  
      
    ) dbt_internal_test