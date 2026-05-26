with source as (
        select * from {{ source('postgres_public', 'activity_types') }}
  ),
  renamed as (
      select
         cast( {{ adapter.quote("id") }} as integer ) as activity_type_id,
         {{ adapter.quote("name") }} as activity_type_name,
        cast( {{ adapter.quote("active") }} as BOOLEAN ) as is_active,
        cast( {{ adapter.quote("type") }} as VARCHAR ) as activity_type

      from source
  )
  select * from renamed
    