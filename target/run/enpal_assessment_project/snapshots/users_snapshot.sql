
      update "postgres"."snapshots"."users_snapshot"
    set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
    from "users_snapshot__dbt_tmp171640671152" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_scd_id::text = "postgres"."snapshots"."users_snapshot".dbt_scd_id::text
      and DBT_INTERNAL_SOURCE.dbt_change_type::text in ('update'::text, 'delete'::text)
      
        and "postgres"."snapshots"."users_snapshot".dbt_valid_to is null;
      


    insert into "postgres"."snapshots"."users_snapshot" ("user_id", "user_name", "email", "modified_time", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
    select DBT_INTERNAL_SOURCE."user_id",DBT_INTERNAL_SOURCE."user_name",DBT_INTERNAL_SOURCE."email",DBT_INTERNAL_SOURCE."modified_time",DBT_INTERNAL_SOURCE."dbt_updated_at",DBT_INTERNAL_SOURCE."dbt_valid_from",DBT_INTERNAL_SOURCE."dbt_valid_to",DBT_INTERNAL_SOURCE."dbt_scd_id"
    from "users_snapshot__dbt_tmp171640671152" as DBT_INTERNAL_SOURCE
    where DBT_INTERNAL_SOURCE.dbt_change_type::text = 'insert'::text;

  