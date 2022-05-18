
{% macro get_location_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "address", "datatype": dbt_utils.type_string()},
    {"name": "timezone", "datatype": dbt_utils.type_string()},
    {"name": "capabilities", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "merchant_id", "datatype": dbt_utils.type_int()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "language_code", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "phone_number", "datatype": dbt_utils.type_string()},
    {"name": "business_name", "datatype": dbt_utils.type_string()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "website_url", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}