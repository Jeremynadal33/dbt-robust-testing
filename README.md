# dbt-robust-testing


You are a Data Engineer arriving on an existing project with many problems. 

<details> <summary><strong>Setup</strong></summary>

<ul>

<li> <a href="https://code.visualstudio.com/remote/advancedcontainers/docker-options">Install Docker (Docker Desktop or Colima)</a>
<li> <a href="https://code.visualstudio.com/">Install VSCode </a>
<li> <a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers">Install DevContainers VSCode extension </a>
<li> <a href="https://github.com/Jeremynadal33/dbt-robust-testing">Clone the repository : Jeremynadal33/dbt-robust-testing </a>
<li> Open the project in VSCode and follow instructions. (If nothing pops, do ctrl+maj+p and type <strong>Reopen folder in Dev Containers</strong>)
<li> If you have a "Missing dbt core" message, do ctrl+maj+p and type <strong>Python: Select Interpreter</strong> and choose the virtual env.
<li> Help your friend/neighbor.



</ul>
<br>

</details>


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

[To the slides](https://www.canva.com/design/DAGkoojaJ94/wzqGMYwxNT2R_4opIEZYCg/view?utm_content=DAGkoojaJ94&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=hebfe3a1304)
