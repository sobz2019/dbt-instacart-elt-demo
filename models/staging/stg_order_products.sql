{{ config(materialized='view') }}

with raw as (
    select * 
    from {{ source('instacart_raw', 'order_products') }}
)

select 
    order_id,
    product_id,
    add_to_cart_order,
    reordered,
    current_timestamp() as dbt_updated_at
from raw
