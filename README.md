Init scripts from dedup + dishes + restaurants 

```sql
alter table orders_dup rename to orders
```
```sql
alter table orders add column status string
```

```sql
update orders
  set status = 'Success' where restaurant_identifier = 1; 
update orders
  set status = 'Success' where restaurant_identifier = 2; 
update orders
  set status = 'success' where restaurant_identifier = 3; 
update orders
  set status = 'Success' where restaurant_identifier = 4; 
update orders
  set status = 'success ' where restaurant_identifier = 5; 
update orders
  set status = 'Success ' where restaurant_identifier = 6; 
update orders
  set status = 'succesS' where restaurant_identifier = 7; 
update ordersloc
  set status = 'pending' where identifier % 200 = 1;
```

```sql
-- je veux que les plats avec id 10, 23, 28 qui n'ont pas de champ hh_price ne soient commandés que par le restaurant 7
select
        identifier
        , restaurant_identifier
        , list_transform(dishes_ids::integer[], x -> x + 1) as dishes_ids
        , payment_method
        , amount
        , created_at
    from
        {{ ref('orders') }}
    where
        (
            list_contains(dishes_ids::integer[], 10)
            or list_contains(dishes_ids::integer[], 23)
            or list_contains(dishes_idas::integer[], 28)
        )
        and restaurant_identifier != 7
```