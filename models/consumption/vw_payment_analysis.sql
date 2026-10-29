{{
    config(
        materialized = 'view',
        database = 'DB_MART',
        schema = 'SC_MART'
    )
}}

SELECT
    p.payment_id,
    p.order_id,
    o.customer_id,
    p.payment_method,
    p.payment_status,
    p.payment_date,
    p.AMOUNT as payment_amount,

    CASE
        WHEN UPPER(payment_status) = 'SUCCESS'
            THEN payment_amount
        ELSE 0
    END AS successful_payment_amount,

    CASE
        WHEN UPPER(payment_status) = 'FAILED'
            THEN 1
        ELSE 0
    END AS failed_payment_flag,

    CURRENT_TIMESTAMP() AS dbt_processed_time

FROM {{ ref('fct_payments') }} p
inner join {{ref('fct_orders')}} o on
p.order_id = o.order_id
