with source as (
        select * from "postgres"."public"."activity_types"
  ),
  renamed as (
      select
         cast( "id" as integer ) as activity_type_id,
         "name" as activity_type_name,
        cast( "active" as BOOLEAN ) as is_active,
        cast( "type" as VARCHAR ) as activity_type

      from source
  )
  select * from renamed