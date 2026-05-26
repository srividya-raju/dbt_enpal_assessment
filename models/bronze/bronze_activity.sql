with source as (
        select * from {{ source('postgres_public', 'activity') }}
  ),
  renamed as (
      select
         cast ( {{ adapter.quote("activity_id") }} as integer )as activity_id,
        {{ adapter.quote("type") }} as activity_type,
       cast ( {{ adapter.quote("assigned_to_user") }} as integer ) as assigned_user_id,
        cast ({{ adapter.quote("deal_id") }} as integer ) as deal_id,
       cast( {{ adapter.quote("done") }} as BOOLEAN )as is_completed,
       cast( {{ adapter.quote("due_to") }}  as TIMESTAMP )as due_date

      from source
  )
  select * from renamed
    