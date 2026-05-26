
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_activities__dbt_tmp"
  
  
    as
  
  (
    with deduped as (select
        *,
       row_number() over (partition by activity_id) as rn
    from  "postgres"."public_pipedrive_analytics"."bronze_activity" 
)

select
   id as listing_id,
        outlet_id,
        platform_id,
        cast(timestamp as date) as listing_date
from deduped
where rn = 1
  );
  