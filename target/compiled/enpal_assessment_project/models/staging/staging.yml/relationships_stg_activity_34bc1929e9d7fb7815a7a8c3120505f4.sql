
    
    

with child as (
    select assigned_user_id as from_field
    from "postgres"."public_pipedrive_staging"."stg_activity"
    where assigned_user_id is not null
),

parent as (
    select user_id as to_field
    from "postgres"."public_pipedrive_staging"."stg_users"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


