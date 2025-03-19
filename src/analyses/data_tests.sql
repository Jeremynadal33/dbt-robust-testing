select
    identifier
from
    {{ ref('fact_orders') }}
group by
    1
having
    count(*) > 1
;









select
    identifier
from
    {{ source('raw_data', 'orders') }}
group by
    1
having
    count(*) > 1
;