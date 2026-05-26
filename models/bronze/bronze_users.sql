with source as (
        select * from {{ source('postgres_public', 'users') }}
  ),
  renamed as (
      select
          cast( {{ adapter.quote("id") }} as integer ) as user_id,
          {{ adapter.quote("name") }} as user_name ,
            {{ adapter.quote("email") }} as email,
            cast( {{ adapter.quote("modified") }} as TIMESTAMP ) as modified_time

      from source
  )
  select * from renamed