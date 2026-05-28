with source as (
        select * from {{ source('postgres_public', 'activity_types') }}
  ),
  renamed as (
      select
         cast( id as integer ) as activity_type_id,
         name as activity_type_name,
         case when lower(active) = 'yes' then true else false end as is_active,
         cast( type as VARCHAR ) as activity_type

      from source
  )
  select * from renamed
    