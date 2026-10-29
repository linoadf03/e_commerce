{{
    config(
        materialized='view',
        database= 'db_staging',
        schema= 'sc_staging'
    )
}}

select
    PRODUCT_ID,
    CATEGORY_ID,
    PRODUCT_NAME,
    SKU,
    PRICE,
    STATUS,
    LOAD_TIME
from {{source('source_raw','products')}}