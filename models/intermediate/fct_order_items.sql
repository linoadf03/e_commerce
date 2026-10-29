{{
    config(
        materialized='table',
        database= 'db_dim_fact',
        schema= 'sb_dim_fact'
    )
}}

select 
    ot.ORDER_ITEM_ID,
    ot.ORDER_ID,
    ot.product_id,
    ot.QUANTITY,
    ot.UNIT_PRICE,
    ot.DISCOUNT,
    ot.TOTAL_AMOUNT,
    ot.LOAD_TIME
from {{ref('stg_order_items')}} ot