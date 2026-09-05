{% macro payment_status_flag(payment_status_column) %}
    case
        when {{ payment_status_column }} = 'SUCCESS' then 'ACCEPTED'
        when {{ payment_status_column }} is null then 'NO_PAYMENT_FOUND'
        else 'REJECTED'
    end
{% endmacro %}