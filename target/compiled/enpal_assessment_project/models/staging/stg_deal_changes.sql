with source as (
        select * from "postgres"."public"."deal_changes"
  ),
  renamed as (
      select
            cast( deal_id as integer ) as deal_id,
            cast( change_time as TIMESTAMP ) as change_time,
            changed_field_key as changed_field_key,
            new_value as new_value

      from source
  )
  select * from renamed