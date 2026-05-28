
  create view "postgres"."public_pipedrive_staging"."stg_activity__dbt_tmp"
    
    
  as (
    with source as (
        select * from "postgres"."public"."activity"
  ),
  renamed as (
      select
        cast ( activity_id as integer )as activity_id,
        type as activity_type,
        cast ( assigned_to_user as integer ) as assigned_user_id,
        cast (deal_id as integer ) as deal_id,
        cast( done as BOOLEAN )as is_completed,
        cast( due_to  as TIMESTAMP )as due_date

      from source
  )
  select * from renamed
  );