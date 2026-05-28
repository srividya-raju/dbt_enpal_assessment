with users as (
    select user_id, 
    user_name, 
    email, 
    modified_time,
    dbt_valid_from,
    coalesce(dbt_valid_to, '9999-12-31'::timestamp) as dbt_valid_to
    from "postgres"."snapshots"."users_snapshot"
)

select * from users
where dbt_valid_to > current_timestamp