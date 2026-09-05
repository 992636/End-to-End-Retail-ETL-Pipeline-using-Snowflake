{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select
    order_id,
    customer_id,
    product_id,
    quantity,
    to_date(order_date) as order_date,
    order_status,
    total_amount,
    last_updated

from {{ source('retail', 'orders_stg') }}

where order_id is not null
  and customer_id is not null

{% if is_incremental() %}
  and last_updated > (select max(last_updated) from {{ this }})
{% endif %}

qualify row_number() over (
    partition by order_id
    order by last_updated desc
) = 1