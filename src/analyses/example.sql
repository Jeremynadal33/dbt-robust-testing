select * 
from {{ ref('example') }}
where
  id is null;


select * from "init-db"."main_dbt_test__audit"."not_null_example_id";