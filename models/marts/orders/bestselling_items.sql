with orders as (

    select * 
    from {{ ref('stg_order') }}
),

order_items as (

    select *
    from {{ ref('stg_order_line_item') }}
),

daily_item_sales as (
    select date(orders.created_at) as date, 
           order_items.catalog_object_id,
           orders.location_id, 
           SUM(order_items.total_money) as item_money,
           SUM(order_items.quantity) as quantity

    from orders
    left join order_items on order_items.order_id = orders.order_id
    group by 1,2,3
)

select *
from daily_item_sales