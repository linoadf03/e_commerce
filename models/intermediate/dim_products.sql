{{
    config(
        materialized='table',
        database= 'db_dim_fact',
        schema= 'sb_dim_fact'
    )
}}

select
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.SKU,
    p.PRICE,
    p.STATUS as price_status,
    c.category_id,
    c.category_name,
    c.parent_category_id,
    c.load_time
from  {{ref('stg_products')}} p
    inner join
    {{ref('stg_categories')}} c
    on p.category_id = c.category_id

