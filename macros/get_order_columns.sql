

{% macro get_order_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "customer_id", "datatype": dbt_utils.type_int()},
    {"name": "location_id", "datatype": dbt_utils.type_int()},
    {"name": "reference_id", "datatype": dbt_utils.type_int()},
    {"name": "order_source_name", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "closed_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "return_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "net_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "rounding_adjustment", "datatype": dbt_utils.type_numeric()},
    {"name": "total_money", "datatype": dbt_utils.type_numeric()},
    {"name": "total_tax_money", "datatype": dbt_utils.type_numeric()},
    {"name": "total_discount_money", "datatype": dbt_utils.type_numeric()},
    {"name": "total_service_charge_money", "datatype": dbt_utils.type_numeric()}
] %}

{{ return(columns) }}

{% endmacro %}