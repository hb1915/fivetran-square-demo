with low_stock as (

    select *
    from {{ ref('low_stock') }}
),

bestselling_items as (

    select *
    from {{ ref('bestselling_items') }}
),

last_week_sales as (

    select catalog_object_id, 
           location_id,
           SUM(quantity) as last_7_days_sales

    from bestselling_items
    where date >= {{ dbt_date.n_days_ago(7) }}
    group by 1,2
),

low_cover as (

    select low_stock.catalog_object_id,
           low_stock.location_id, 
           last_week_sales.last_7_days_sales,
           low_stock.quantity as stock_quantity,
           low_stock.quantity/NULLIF(last_week_sales.last_7_days_sales,0) as weeks_of_cover
           
    from low_stock
    left join last_week_sales on low_stock.catalog_object_id = last_week_sales.catalog_object_id and low_stock.location_id = last_week_sales.location_id

)

select *
from low_cover