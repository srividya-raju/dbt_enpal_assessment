with source as (
        select * from "postgres"."public"."fields"
  ),
  renamed as (
      select
          cast( "id" as integer ) as field_id,
          field_key,
          name as field_name,
           field_value_options::json as field_value_options

      from source
  )
  select * from renamed