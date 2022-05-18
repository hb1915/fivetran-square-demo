 

{% macro get_inventory_count_history_columns() %}

{% set columns = [
    {"name": "catalog_object_id", "datatype": dbt_utils.type_int()},
    {"name": "location_id", "datatype": dbt_utils.type_int()},
    {"name": "calculated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "catalog_object_type", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "quantity", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}