      
{% macro get_catalog_object_columns() %}

{% set columns = [
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "version", "datatype": dbt_utils.type_string()},
    {"name": "is_deleted", "datatype": dbt_utils.type_string()},
    {"name": "catalog_v1_ids", "datatype": dbt_utils.type_string()},
    {"name": "present_at_all_locations", "datatype": dbt_utils.type_int()},
    {"name": "present_at_location_ids", "datatype": dbt_utils.type_string()},
    {"name": "absent_at_location_ids", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
      
