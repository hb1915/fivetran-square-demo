with base as (

    select * 
    from {{ ref('base_inventory_count_history') }}

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
                source_columns=adapter.get_columns_in_relation(ref('base_inventory_count_history')),
                staging_columns=get_inventory_count_history_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        catalog_object_id,
        location_id,
        cast(calculated_at as {{ dbt_utils.type_timestamp() }}) as calculated_at,
        catalog_object_type,
        state,
        quantity

    from fields
)

select *
from final