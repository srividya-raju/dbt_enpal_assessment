
    
    

with all_values as (

    select
        activity_type as value_field,
        count(*) as n_records

    from "postgres"."public_pipedrive_staging"."stg_activity_types"
    group by activity_type

)

select *
from all_values
where value_field not in (
    'meeting','sc_2','follow_up','after_close_call'
)


