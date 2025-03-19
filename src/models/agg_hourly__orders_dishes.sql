with orders as (
    select * from {{ ref('fact_orders') }}
)

, dishes as (
    select
        identifier
        , name
        , selling_price::json as selling_price
    from
        {{ source('raw_data', 'dishes') }}
)

, restaurants as (
    select * from {{ source('raw_data', 'restaurants') }}
)

, orders_flattened as (
    select
        identifier
        , restaurant_identifier
        , unnest(dishes_ids) as dish_id
        , created_at
    from
        orders
)

, final as (
    select
        d.identifier as dish_id
        , d.name as dish_name
        , date_trunc('hour', of.created_at) as hour
        , count(1) as orders_count
        , sum(
            case
                when hour(of.created_at) between r.hh_start and r.hh_end
                    then d.selling_price.hh_price::double
                else
                    d.selling_price.price::double
            end
        ) as total_selling_price
    from
        orders_flattened as of
    join
        dishes as d
        on of.dish_id = d.identifier
    join
        restaurants as r
        on of.restaurant_identifier = r.identifier
    group by
        1, 2, 3
)

select * from final
