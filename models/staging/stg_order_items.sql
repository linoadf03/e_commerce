{{
    config(
        materialized='view',
        database= 'db_staging',
        schema= 'sc_staging'
        
    )
}}

select 
    ORDER_ITEM_ID,
    ORDER_ID,
    PRODUCT_ID,
    QUANTITY,
    UNIT_PRICE,
    DISCOUNT,
    TOTAL_AMOUNT,
    LOAD_TIME
from {{source('source_raw','order_items')}}