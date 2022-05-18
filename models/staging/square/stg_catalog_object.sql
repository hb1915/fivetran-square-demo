with base as (

    select * 
    from {{ ref('base_catalog_object') }}

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
                source_columns=adapter.get_columns_in_relation(ref('base_catalog_object')),
                staging_columns=get_catalog_object_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        type,
        id as catalog_object_id, 
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        version,
        is_deleted,
        catalog_v1_ids,
        present_at_all_locations,
        present_at_location_ids,
        absent_at_location_ids

    from fields
)

select *
from final