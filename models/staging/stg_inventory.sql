{{
    config(
        materialized='view',
        database= 'db_staging',
        schema= 'sc_staging'
    )
}}

select
    INVENTORY_ID,
    PRODUCT_ID,
    WAREHOUSE_ID,
    STOCK_QUANTITY,
    LAST_UPDATED,
    LOAD_TIME
from {{source('source_raw','inventory')}}