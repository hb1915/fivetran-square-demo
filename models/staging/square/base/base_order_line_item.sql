
select *
from {{ source('square','order_line_item')}}