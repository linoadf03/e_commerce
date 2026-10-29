{{
    config(
        materialized='table',
        database= 'db_dim_fact',
        schema= 'sb_dim_fact'
    )
}}

select
    c.customer_id,
    c.customer_name,
    c.email,
    c.phone,
    c.registered_date,
    c.status as customer_status, 
    l.city,
    l.state,
    l.country,
    l.region,
    l.load_time
from {{ref('stg_customers')}} c
    inner join 
    {{ref('stg_locations')}} l
    on c.city_id = l.city_id