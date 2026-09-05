{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='last_updated'
    )
}}

select
    customer_id,
    first_name,
    last_name,
    email,
    city,
    state,
    last_updated
from {{ ref('stg_customers') }}

{% endsnapshot %}