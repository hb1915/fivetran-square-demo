with orders as (

    select *
    from {{ ref('stg_order') }}
),

orders_by_day as (
    
    select date(created_at) as date, 
           SUM(total_money) as total_money

    from orders
    group by date

)


select *
from orders_by_day
