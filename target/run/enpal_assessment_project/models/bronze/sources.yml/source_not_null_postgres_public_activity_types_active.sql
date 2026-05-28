
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select active
from "postgres"."public"."activity_types"
where active is null



  
  
      
    ) dbt_internal_test