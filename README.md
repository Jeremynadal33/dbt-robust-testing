# dbt-robust-testing


You are a Data Engineer arriving on an existing project with many problems. 

### Set up 
It is better to use VSCode and open the project in the provided __.devcontainers__ but if you don't want to do it you can also install **uv** and run : 

```bash
uv sync
source .venv/bin/activate
```

### Scenarios
Each scenario has its own correction and clues provided in different branches. You can find clues in file corresponding to the scenario in the __analyses__ folder.

<details> <summary>Sceanrio <strong>data_tests</strong></summary>

<p>Your boss isn't happy, the data provided in <a href="src/models/fact_orders.sql">fact_orders</a> contains duplicates. <strong>Please fix it.</strong></p>
<br>

If you have some difficulties, you can use the analysis as clue :
```bash
git switch data_tests_analysis
```

If you did not have time to finish, you can use the correction to begin next scenario : 
```bash
git switch data_tests
```
</details>

<details> <summary>Sceanrio <strong>unit_tests</strong></summary>
Great, no more duplicates ! But your manager feels like there are a lot of missing data. He sees only 2 restaurants but we already have 7 in the company. Can you check what is happening ?

<br>

If you have some difficulties, you can use the analyses on the branch data_tests_analysis 
```bash
git switch unit_tests_analysis
```
If you did not have time to finish, you can use the correction to begin next scenario : 
```bash
git switch unit_tests
```
</details>


<details> <summary>Sceanrio <strong>integration_tests</strong></summary>
All right, <a href="src/models/fact_orders.sql"><strong>fact_orders</strong></a> seems finally right! You receive a call from the <strong>Marketing team</strong> a bit too quick for it to be good. There are now <strong>NULL values</strong> in the <a href="src/models/agg_hourly__orders_dishes.sql"><strong>agg_hourly__orders_dishes</strong></a> model. They are sure it was not the case before. You added a <strong>regression</strong> ! You need to fix it ASAP. 

<br>

If you have some difficulties, you can use the analyses on the branch data_tests_analysis 
```bash
git switch integration_tests_analysis
```
If you did not have time to finish, you can use the correction to begin next scenario : 
```bash
git switch integration_tests
```
</details>


---

[To the slides](https://docs.google.com/presentation/d/1mVhp0eVPjkX9xXjH5fJsOszCoNDmX9E9Jrj-f9hWGmg/edit?usp=sharing)