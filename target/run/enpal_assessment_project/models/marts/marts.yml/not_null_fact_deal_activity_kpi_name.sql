
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select kpi_name
from "postgres"."public_pipedrive_analytics"."fact_deal_activity"
where kpi_name is null



  
  
      
    ) dbt_internal_test