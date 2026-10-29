
{{ config(
    materialized = 'table',
    database= 'db_dim_fact',
    schema= 'sb_dim_fact'
) }}

select
    city_id,
    city,
    state,
    country,
    region,
    load_time
from {{ref('stg_locations')}}