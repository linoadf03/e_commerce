{{
    config(
        materialized='table',
        database= 'db_dim_fact',
        schema= 'sb_dim_fact'
    )
}}

select 
    p.PAYMENT_ID,
    p.ORDER_ID,
    c.CUSTOMER_ID,
    p.PAYMENT_DATE,
    p.PAYMENT_METHOD,
    p.AMOUNT,
    p.PAYMENT_STATUS,
    p.TRANSACTION_ID,
    p.LOAD_TIME
from {{ref('stg_payments')}} p
    inner join {{ref('stg_orders')}} o
    on p.order_id = o.order_id
    inner join {{ref('dim_customers')}} c 
    on o.customer_id = c.customer_id