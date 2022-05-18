
with inventory_count_history as (

    select *
    from {{ ref('stg_inventory_count_history') }}

),

inventory_history_with_row_number as (

    select catalog_object_id, 
           location_id,
           catalog_object_type, 
           quantity, 
           calculated_at, 
           ROW_NUMBER() OVER(PARTITION BY catalog_object_id, location_id order by calculated_at) as row_number

    from inventory_count_history
),

latest_stock as (
    
    select catalog_object_id,
           location_id,
           catalog_object_type, 
           quantity, 
           calculated_at as last_calculated_at

    from inventory_history_with_row_number
    where row_number = 1)

select *
from latest_stock

