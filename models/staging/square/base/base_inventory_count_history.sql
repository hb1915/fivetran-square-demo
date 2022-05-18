
select *
from {{ source('square','inventory_count_history')}}