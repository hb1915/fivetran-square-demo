      
{% macro get_customer_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "given_name", "datatype": dbt_utils.type_string()},
    {"name": "family_name", "datatype": dbt_utils.type_string()},
    {"name": "nickname", "datatype": dbt_utils.type_string()},
    {"name": "company_name", "datatype": dbt_utils.type_string()},
    {"name": "email_address", "datatype": dbt_utils.type_string()},
    {"name": "address", "datatype": dbt_utils.type_string()},
    {"name": "phone_number", "datatype": dbt_utils.type_string()},
    {"name": "birthday", "datatype": dbt_utils.type_string()},
    {"name": "reference_id", "datatype": dbt_utils.type_int()},
    {"name": "note", "datatype": dbt_utils.type_string()},
    {"name": "preference_email_unsubscribed", "datatype": dbt_utils.type_string()},    
    {"name": "creation_source", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
      