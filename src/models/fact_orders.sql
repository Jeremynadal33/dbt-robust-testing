with orders as (
    select * from {{ source('raw_data', 'orders') }}
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
        regexp_matches(status, '^[Ss]uccess$')
)
select * from filtered

