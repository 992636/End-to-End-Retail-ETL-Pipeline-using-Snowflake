select
{{ dbt_utils.generate_surrogate_key(['o.order_id', 'pay.payment_id']) }} as fct_orders_id,
    o.order_id,
    o.order_date,
    o.order_status,
    o.quantity,
    o.total_amount,

    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.state,

    p.product_id,
    p.product_name,
    p.category,
    p.price as product_price,

    pay.payment_id,
    pay.payment_mode,
    pay.payment_status,
    pay.amount as payment_amount,

    {{ payment_status_flag('pay.payment_status') }} as payment_review_flag

from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('stg_products') }} p
    on o.product_id = p.product_id
left join {{ ref('stg_payments') }} pay
    on o.order_id = pay.order_id
    