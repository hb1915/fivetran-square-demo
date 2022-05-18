with base as (

    select * 
    from {{ ref('base_customer') }}

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
                source_columns=adapter.get_columns_in_relation(ref('base_customer')),
                staging_columns=get_customer_columns()
            )
        }}
        
    from base
),

final as (
    
    select 

        id as customer_id,
        cast(created_at as {{ dbt_utils.type_timestamp() }}) as created_at,
        cast(updated_at as {{ dbt_utils.type_timestamp() }}) as updated_at,
        given_name,

        family_name,
        nickname,
        company_name,
        email_address,
        address,
        phone_number,
        birthday,
        reference_id,
        note,
        preference_email_unsubscribed,
        creation_source

    from fields
)

select *
from final