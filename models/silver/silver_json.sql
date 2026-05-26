WITH source AS (

SELECT
field_id,
field_key,
field_name,


    cast(element_->>'id' as integer)
        AS id,

    element_ ->> 'label'
        AS label

   

FROM  {{ ref('bronze_fields') }} t
cross join lateral jsonb_array_elements(t.field_value_options::jsonb) AS element_
)
SELECT
* from source