with source as (
        select * from {{ source('postgres_public', 'deal_changes') }}
  ),
  renamed as (
      select
            cast( {{ adapter.quote("deal_id") }} as integer ) as deal_id,
            cast( {{ adapter.quote("change_time") }} as TIMESTAMP ) as change_time,
            {{ adapter.quote("changed_field_key") }} as changed_field_key,
            {{ adapter.quote("new_value") }} as new_value

      from source
  )
  select * from renamed
    