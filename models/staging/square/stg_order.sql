with base as (

    select * 
    from {{ ref('base_order') }}

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
                source_columns=adapter.get_columns_in_relation(ref('base_order')),
                staging_columns=get_order_columns()
            )
        }}
        
    from base
),

final as (
    
    select 


        id as order_id,
        customer_id,
        location_id,
        reference_id,
        order_source_name,           
        cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        cast(closed_at as {{ dbt_utils.type_timestamp() }}) as closed_at,
        state,
        return_amount,
        net_amount,
        rounding_adjustment,
        total_money,
        total_tax_money,
        total_discount_money,
        total_service_charge_money

    from fields
)

select *
from final