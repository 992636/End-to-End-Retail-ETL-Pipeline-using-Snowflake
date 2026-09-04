select
    payment_id,
    order_id,
    payment_mode,
    to_date(payment_date) as payment_date,
    payment_status,
    amount,
    last_updated

from {{ source('retail', 'payments_stg') }}

where payment_id is not null
  and order_id is not null

qualify row_number() over (
    partition by payment_id
    order by last_updated desc, payment_mode
) = 1