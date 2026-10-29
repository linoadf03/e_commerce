{{
    config(
        materialized='table',
        database= 'db_dim_fact',
        schema= 'sb_dim_fact'
    )
}}

select
    o.order_id,
    c.customer_id,
    l.city_id,
    o.order_date,
    o.order_status,
    o.payment_method,
    o.grand_total,
    o.load_time
from {{ref('stg_orders')}} o
    inner join {{ref('dim_customers')}} c
    on o.customer_id = c.customer_id
    inner join
    {{ref('dim_locations')}} l 
    on o.shipping_city_id = l.city_id


