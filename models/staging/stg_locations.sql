
{{ config(
    materialized = 'view',
    database = 'db_staging',
    schema = 'sc_staging'
) }}

select
    city_id,
    city,
    state,
    country,
    region,
    load_time
from {{source('source_raw', 'locations')}}