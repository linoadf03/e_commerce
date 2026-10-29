{{
    config(
        materialized = 'view',
        database = 'DB_MART',
        schema = 'SC_MART'
    )
}}


SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    oi.product_id,
    p.product_name,
    p.CATEGORY_ID,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS sales_amount,

    CASE
        WHEN UPPER(o.order_status) = 'CONFIRMED'
            THEN oi.quantity * oi.unit_price
        ELSE 0
    END AS completed_sales_amount,

    CURRENT_TIMESTAMP() AS dbt_processed_time

FROM {{ ref('fct_orders') }} o

INNER JOIN {{ ref('fct_order_items') }} oi
    ON o.order_id = oi.order_id

LEFT JOIN {{ ref('dim_customers') }} c
    ON o.customer_id = c.customer_id

LEFT JOIN {{ ref('dim_products') }} p
    ON oi.product_id = p.product_id