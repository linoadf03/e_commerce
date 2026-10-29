{{
    config(
        materialized='view',
        database= 'db_staging',
        schema= 'sc_staging'
    )
}}

select 
    address_id,
    customer_id,
    city_id,
    address_type,
    street,
    postal_code,
    load_time
from {{source('source_raw','addresses')}}