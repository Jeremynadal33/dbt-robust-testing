with orders as (
    select distinct * from {{ mockable_source('raw_data', 'orders') }}
)

, filtered as (
    select
        identifier
        , restaurant_identifier
        , dishes_ids::integer[] as dishes_ids
        , payment_method
        , amount
        , created_at
    from
        orders
    where
        regexp_matches(trim(status), '^(?i)success$')
)

select * from filtered
