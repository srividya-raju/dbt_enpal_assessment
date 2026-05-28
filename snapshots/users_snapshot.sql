{% snapshot users_snapshot %}
{{
    config
    (   target_schema='snapshots',
        strategy='check', 
        unique_key='user_id', 
        check_cols=[ 'user_name', 'email'])
}}

select * from {{ ref('stg_users') }}


{% endsnapshot %}