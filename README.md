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

<p>Your boss isn't happy, the data provided in <a href="src/models/fact_orders.sql">fact_orders</a> contains duplicates. <strong>Please fix it !</strong></p>
<ol>
<li>Identify the issue: Check the data quality of <code>fact_orders</code>. Create a new analysis file to easily run queryies against the database. You can use <a href="https://docs.getdbt.com/reference/dbt-jinja-functions/ref">ref</a> and <a href = "https://docs.getdbt.com/reference/dbt-jinja-functions/source"> source</a> functions to reference tables created by dbt and sources within the database</li>
<li>Write appropriate <a href="https://docs.getdbt.com/docs/build/data-tests"> data tests </a>to catch duplicates on the <code>identifier</code> field of the <code>fact_orders</code> model</li>
<li>Run <code>dbt test</code> tests to confirm the problem raises an error</li>
<li>Fix the underlying data issue (a simple <code>distinct *</code> solves it)</li>
<li>Run your model again with <code>dbt run -s fact_orders</code> & and run <code>dbt test</code> again to verify the test pass after the fix</li>
<li>(Optional) You identified the problem comes from the source table, it would be a good idea to add a test on the source to show to other users there are duplicates in it too. You have fixed the uses downstream so you should put a <a href="https://docs.getdbt.com/reference/resource-configs/severity">warning</a> instead. Run <code>dbt test</code> again to show the warning works</li>
</ol>
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
<p>Great, no more duplicates ! But your manager feels like there are a lot of missing data. He sees only 2 restaurants but we already have 7 in the company. Can you check what is happening ?</p>
<ol>  

<li>Identify the issue: Check the data quality of the source <code>orders</code>. Create a new analysis file to run queries and understand why some restaurants are missing.</li>
<li>Write <a href="https://docs.getdbt.com/docs/build/unit-tests">unit tests</a> to ensure that all orders present in the source is present in <code>fact_orders</code>. 
<details> <summary> <em> Hint </em></summary> 
<em>Review the possible values in the <code>status</code> field to ensure all statuses are well formated.</em> </details>
<li>Run <code>dbt test</code> to confirm that your tests detect the problem.</li>
<li>Fix the issue in <code>fact_orders</code>.</li>
<details> <summary> <em> Hint </em></summary> 
<em>One possible solution is to apply a regex filter to ensure all 'Succeded' values are accepted.</em> </details>
<li>Run <code>dbt run -s fact_orders</code> and then <code>dbt test</code> to make sure the tests pass after the correction.</li>
</ol>
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
All right, <a href="src/models/fact_orders.sql"><strong>fact_orders</strong></a> seems finally right! You receive a call from the <strong>Marketing team</strong> a bit too quick for it to be good. There are now <code>NULL</code> values in the <code>total_selling_price</code> field of <a href="src/models/agg_hourly__orders_dishes.sql"><strong>agg_hourly__orders_dishes</strong></a> model. They are sure it was not the case before. You added a <strong>regression</strong> ! You need to fix it ASAP. 

<br>

<ol>
    <li>Identify & fix the issue: Check the data quality of <code>agg_hourly__orders_dishes</code>. Create a new analysis file to easily run queryies against the database. This one is tricky to detect ! You can : </li>
    <ol type="A">
      <li>Identify which lines contains <code>NULL</code> values</li>
      <li>Check what the <code>dishes</code> source look like (you can use <code>::json</code> to cast a field into json)</li>
      <li>Fix the model to handle cases where dishes does not have a price in happy hour</li>
      <li>(Optional) Understand why you did not have the problem before.</li>
    </ol>
    <li>We will write integration tests (i.e. we mock the sources in a <code>src/seeds/samples</code> folder and the expected output of your models in a <code>src/seeds/expects</code> as <a href="https://docs.getdbt.com/docs/build/seeds">csv seeds</a> and compare the expected outputs with the real output of your <code>dbt run</code> command. See more in <a href="https://blog.ippon.fr/2022/01/07/testez-votre-code-sql-avec-dbt/">this article</a> chapter "Tests d’intégrations")</li>
    <ol type="A">
      <li>Create samples : <code>sample_orders.csv</code>, <code>sample_dishes.csv</code>, <code>sample_restaurants.csv</code> files and put just enough rows to test your models (You can find these <a href="https://github.com/Jeremynadal33/dbt-robust-testing/tree/integration_tests/src/seeds/samples">samples here</a>)</li>
      <li>Create a macro called <code>mockable_source</code> that will replace the <code>source</code> macro and will use the <strong>samples</strong> in <code>dev</code> and the real table in <code>prod</code> (Hint : you can use the builtin <a href="https://docs.getdbt.com/reference/dbt-jinja-functions/target">target variable</a> to know which env you are in. You can also find an implementation of the <a href="https://github.com/Jeremynadal33/dbt-robust-testing/blob/integration_tests/src/macros/mockable_source.sql">macro here</a>) </li>
      <li>Create expected output in  <code>expect_agg_hourly__orders_dishes.csv</code></li>
      <li>Add an equality test using <a href="https://github.com/dbt-labs/dbt-utils?tab=readme-ov-file#equality-source">dbt_utils.equality</a> (Hint: <a href="https://docs.getdbt.com/docs/build/packages">See here</a> to understand how to add a package) </li>
      <li>Run <code>dbt test</code> to see if your test works </li>
    </ol>
</ol>

<br>

If you have some difficulties, you can use the analyses on the branch data_tests_analysis 
```bash
git switch integration_tests_analysis
```
If you did not have time to finish, you can use the correction : 
```bash
git switch integration_tests
```
</details>


---

[To the slides](https://www.canva.com/design/DAGkoojaJ94/wzqGMYwxNT2R_4opIEZYCg/view?utm_content=DAGkoojaJ94&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=hebfe3a1304)
