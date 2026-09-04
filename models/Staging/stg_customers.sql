select
    customer_id,
    first_name,
    last_name,
    email,
    contact_no,
    to_date(dob) as dob,
    address,
    city,
    state,
    country,
    to_date(registration_date) as registration_date,
    last_updated

from {{ source('retail', 'customers_stg') }}

where customer_id is not null
  and email is not null

qualify row_number() over (
    partition by customer_id
    order by last_updated desc
) = 1