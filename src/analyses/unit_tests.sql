select
    distinct restaurant_identifier
from
    {{ ref('fact_orders') }}
;





select
    distinct restaurant_identifier, status
from
    {{ source('raw_data', 'orders') }}
order by 1
;

