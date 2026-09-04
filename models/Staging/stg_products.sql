select
    product_id,
    product_name,
    category,
    price,
    stock_quantity,
    status,
    last_updated

from {{ source('retail', 'products_stg') }}

where product_id is not null

qualify row_number() over (
    partition by product_id
    order by last_updated desc, product_name
) = 1