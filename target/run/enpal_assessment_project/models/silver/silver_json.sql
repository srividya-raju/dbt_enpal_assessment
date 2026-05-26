
  
    

  create  table "postgres"."public_pipedrive_analytics"."silver_json__dbt_tmp"
  
  
    as
  
  (
    WITH source AS (

SELECT
field_id,
field_key,
field_name,


    cast(element_->>'id' as integer)
        AS id,

    element_ ->> 'label'
        AS label

   

FROM  "postgres"."public_pipedrive_analytics"."bronze_fields" t
cross join lateral jsonb_array_elements(t.field_value_options::jsonb) AS element_
)
SELECT
* from source
  );
  