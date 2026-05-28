
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_change_time
from "postgres"."public_pipedrive_intermediate"."int_union_deals_activity"
where deal_change_time is null



  
  
      
    ) dbt_internal_test