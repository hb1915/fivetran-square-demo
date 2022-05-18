
{% macro get_order_line_item_columns() %}

{% set columns = [
    {"name": "uid", "datatype": dbt_utils.type_int()},
    {"name": "order_id", "datatype": dbt_utils.type_int()},
    {"name": "catalog_object_id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "quantity", "datatype": dbt_utils.type_int()},
    {"name": "note", "datatype": dbt_utils.type_string()},
    {"name": "variation_name", "datatype": dbt_utils.type_timestamp()},
    {"name": "base_price_money", "datatype": dbt_utils.type_numeric()},
    {"name": "gross_sales_money", "datatype": dbt_utils.type_numeric()},
    {"name": "total_tax_money", "datatype": dbt_utils.type_numeric()},
    {"name": "total_discount_money", "datatype": dbt_utils.type_numeric()},
    {"name": "total_money", "datatype":dbt_utils.type_numeric()}
] %}

{{ return(columns) }}

{% endmacro %}