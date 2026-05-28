
  create view "postgres"."public_pipedrive_staging"."stg_users__dbt_tmp"
    
    
  as (
    with source as (
        select * from "postgres"."public"."users"
  ),
  renamed as (
      select
          cast( id as integer ) as user_id,
          name as user_name ,
          email as email,
          cast( modified as TIMESTAMP ) as modified_time

      from source
  )
  select * from renamed
  );