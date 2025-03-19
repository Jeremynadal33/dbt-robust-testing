select
    *
from
    {{ ref('agg_hourly__orders_dishes') }}
where
    total_selling_price is null
;






select
    identifier
    , name
    , selling_price::json as selling_price
from
    {{ source('raw_data', 'dishes') }}
;





select
    identifier
    , name
    , selling_price::json as selling_price
from
    {{ source('raw_data', 'dishes') }}
where
    (selling_price::json).hh_price is null

;


select
    distinct restaurant_identifier, status
from
    {{ source('raw_data', 'orders') }}
where
    list_contains(dishes_ids::integer[], 10)
    or list_contains(dishes_ids::integer[], 23)
    or list_contains(dishes_ids::integer[], 28)

;