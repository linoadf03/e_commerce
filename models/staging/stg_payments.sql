{{
    config(
        materialized='view',
        database= 'db_staging',
        schema= 'sc_staging'
    )
}}

select 
    PAYMENT_ID,
    ORDER_ID,
    PAYMENT_DATE,
    PAYMENT_METHOD,
    AMOUNT,
    PAYMENT_STATUS,
    TRANSACTION_ID,
    LOAD_TIME
from {{source('source_raw','payments')}}