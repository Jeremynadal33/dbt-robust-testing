# Cheat Sheet

## dbt cheat sheet 

### Setup & Initialization
```bash
dbt init <project_name>    # Initialize new dbt project
dbt deps                   # Install dependencies
```

### Running Models
```bash
dbt run                    # Run all models
dbt run --select/-s <model>   # Run specific model
dbt run --select/-s <tag>     # Run models with specific tag
dbt run --exclude <model>  # Run all except specific model
```

### Testing
```bash
dbt test                   # Run all tests
dbt test --select/-s <model>  # Test specific model
dbt test --select <tag>    # Test models with specific tag
```

### Documentation
```bash
dbt docs generate          # Generate documentation
dbt docs serve             # Serve documentation locally
```

### Compilation & Parsing
```bash
dbt compile               # Compile models without running
dbt parse                 # Parse project files
```

### Logs
The logs are in the ```logs``` folder, we can see every query dbt runs. 

### Debugging
```bash
dbt debug                 # Check connection and project setup
dbt show --select <model> # Preview model results
```

### Common Selectors
```bash
--models model_name       # Specific model
--models +model_name      # Model and its upstream dependencies
--models model_name+      # Model and its downstream dependencies
--models +model_name+     # Model and all dependencies
--models tag:my_tag       # Models with specific tag
--models path:marts/      # Models in specific directory
```

### Environment Management
```bash
dbt run --target <env>    # Run against specific target
dbt run --vars '{key: value}'  # Pass variables
```

## Duck DB cheat sheet
### Interface "notebook"
⚠️ Duck DB can write from a single source so if you start the UI and attach th ```init-db.duckdb``` database, you will need to detach the db before running dbt queries.

```bash
duckdb -ui
```

In a cell :
```SQL
ATTACH 'init-db.duckdb' AS dbt_robust_testing;
```

```SQL
DETACH dbt_robust_testing;
```

