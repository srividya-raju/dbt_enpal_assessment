with source as (
        select * from {{ source('postgres_public', 'fields') }}
  ),
  renamed as (
      select
          cast( {{ adapter.quote("id") }} as integer ) as field_id,
          field_key,
          name as field_name,
           field_value_options::json as field_value_options

      from source
  )
  select * from renamed
    