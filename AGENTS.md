# SST Jaffle Shop

## Project Overview

Sample dbt project demonstrating Snowflake Semantic Tools (SST) integration. Built on top of dbt's Jaffle Shop example with a complete semantic layer.

## Structure

```
models/
  staging/      # 6 staging models (stg_customers, stg_orders, etc.)
  marts/        # 7 mart models (customers, orders, order_items, products, locations, supplies, metricflow_time_spine)
snowflake_semantic_models/
  metrics/      # 38 metrics across all domains
  relationships/ # 5 table relationships
  filters/      # Filter examples
  custom_instructions/  # Business rule instructions
  verified_queries/     # Example verified queries
seeds/jaffle-data/      # CSV seed data
```

## Key Configuration

- **sst_config.yaml**: Main SST configuration
  - `project.semantic_models_dir`: "snowflake_semantic_models"
  - `project.dbt_models_dir`: "models"
  - `validation.snowflake_syntax_check`: true (requires active Snowflake account)
- **dbt_project.yml**: name=sst_jaffle_shop, profile=sst_jaffle_shop
- **Snowflake**: Database `SST_JAFFLE_SHOP`, schema `DBT_DEV`

## Model Metadata

All 7 mart models have SST metadata in `config.meta.sst`:
- `primary_key`: Single column (e.g., `customer_id`, `order_id`)
- `unique_keys`: Empty `[]` by default
- `synonyms`: AI-friendly alternative names
- `cortex_searchable`: false (for validation-only models)

Each column has: `column_type` (dimension/fact/time_dimension), `data_type`, `synonyms`, `sample_values`, `is_enum`

## Relationships

| Name | Left | Right | Join Column |
|------|------|-------|-------------|
| orders_to_customers | orders | customers | customer_id |
| orders_to_locations | orders | locations | location_id |
| order_items_to_orders | order_items | orders | order_id |
| order_items_to_products | order_items | products | product_id |
| supplies_to_products | supplies | products | product_id |

## Development

- **Branch**: `complete-project` (main working branch)
- **SST tool**: Install from `snowflake-semantic-tools` repo
- **Validate**: `sst validate` (use `snowflake_syntax_check: false` if Snowflake unavailable)
- **Conda env**: `sst` (shared with SST repo)
- **Manifest**: `target/manifest.json` (recompile with `sst validate --dbt-compile`)
