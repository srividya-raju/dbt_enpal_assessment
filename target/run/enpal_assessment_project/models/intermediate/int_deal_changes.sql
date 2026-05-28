
  
    

  create  table "postgres"."public_pipedrive_intermediate"."int_deal_changes__dbt_tmp"
  
  
    as
  
  (
    --This model is used to deduplicate entire duplicate records.
with deduped as (select
        *,
       row_number() over (
        partition by deal_id,	
                     change_time,
                	 changed_field_key,	
                     new_value) as rn
    from  "postgres"."public_pipedrive_staging"."stg_deal_changes" 
),
filtered_deals_wrt_stages as (
select
  deal_id,	
  change_time,	
  changed_field_key,	
  new_value 
from deduped
where rn = 1
    and deduped.changed_field_key = 'stage_id'

),
final_formatted as (
select
  deal_id,	
  change_time,	
  changed_field_key,	
  new_value::int as stage_id,
   concat('Step ', new_value::int) as funnel_step,
  s.label as kpi_name
  from filtered_deals_wrt_stages f
join "postgres"."public_pipedrive_intermediate"."int_json_unpack" s on f.new_value::int = s.id
where s.field_key = 'stage_id'
),
deduped_deals as (
select
        *,
       row_number() over (
        partition by deal_id,	
                     stage_id
                     order by change_time desc) as rn
    from  final_formatted 
)

select deal_id,
       change_time,
       stage_id,
       funnel_step, 
        kpi_name
from deduped_deals
where rn = 1
  );
  