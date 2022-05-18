with locations as (

    select *
    from {{ ref('stg_location') }}
),

transactions as (

    select *
    from {{ ref('stg_order') }}
),

daily_transactions_by_location as (

    select date(created_at) as date, 
           location_id, 
           COUNT(distinct order_id) as no_orders,
           SUM(total_money) as total_money
           
    from transactions
    group by 1,2
),

daily_top_locations as (

    select daily_transactions_by_location.date, 
           locations.name,
           locations.location_id, 
           daily_transactions_by_location.no_orders, 
           daily_transactions_by_location.total_money

    from daily_transactions_by_location
    left join locations on locations.location_id = daily_transactions_by_location.location_id
)

select *
from daily_top_locations