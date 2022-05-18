with base as (

    select * 
    from {{ ref('base_order_line_item') }}

),

fields as (

    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_stripe_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_stripe_source/macros/).
        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('base_order_line_item')),
                staging_columns=get_order_line_item_columns()
            )
        }}
        
    from base
),

final as (
    
    select 

        uid as order_line_item_id,
        order_id,
        catalog_object_id,
        name,
        quantity,
        note,
        variation_name,
        base_price_money,
        gross_sales_money,
        total_tax_money,
        total_discount_money,
        total_money


    from fields
)

select *
from final