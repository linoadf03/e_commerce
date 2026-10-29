{{
    config(
        materialized = 'view',
        database = 'DB_MART',
        schema = 'SC_MART'
    )
}}

WITH customer_data AS (

    SELECT
        customer_id,
        customer_name,
        email,
        phone,
        registered_date,
        customer_status,
        city
    FROM {{ ref('dim_customers') }}
),

order_summary AS (

    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(grand_total) AS total_spent,
        MAX(order_date) AS last_order_date
    FROM {{ ref('fct_orders') }}
    GROUP BY customer_id

)

SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    c.phone,
    c.registered_date,
    c.customer_status,
    c.city,
    COALESCE(o.total_orders, 0) AS total_orders,
    COALESCE(o.total_spent, 0) AS total_spent,
    o.last_order_date
FROM customer_data c
LEFT JOIN order_summary o
    ON c.customer_id = o.customer_id