{{
    config(
        materialized='view',
        database = 'db_staging',
        schema = 'sc_staging'
    )
}}
select
    category_id,
    category_name,
    parent_category_id,
    status,
    load_time
from {{source('source_raw','categories')}}