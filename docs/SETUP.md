# SST Jaffle Shop Setup Guide

Complete guide to running the SST Jaffle Shop example project.

---

## Prerequisites

Before starting, ensure you have:

- **Python 3.9 or higher**
- **Access to a Snowflake account** with permissions to:
  - Create databases and schemas
  - Run dbt models
  - Create semantic views
- **dbt installed** (dbt Core 1.5+ recommended)

---

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/mluizzi-whoop/sst-jaffle-shop.git
cd sst-jaffle-shop
```

### 2. Install SST

Since SST is not yet published to PyPI, install it from the local directory:

```bash
# Option A: Install from local clone
pip install -e /path/to/snowflake-semantic-tools

# Option B: Install with Poetry
cd /path/to/snowflake-semantic-tools
poetry install
poetry shell
cd /path/to/sst-jaffle-shop
```

Verify installation:
```bash
sst --version
```

### 3. Configure Snowflake Connection

Copy the environment template and fill in your credentials:

```bash
cp .env.example .env
# Edit .env with your Snowflake credentials
```

**Required variables in `.env`:**
```bash
SNOWFLAKE_ACCOUNT=your_account
SNOWFLAKE_USER=your.email@company.com
SNOWFLAKE_WAREHOUSE=YOUR_WAREHOUSE
SNOWFLAKE_ROLE=YOUR_ROLE
```

**Authentication options:**
- **Browser SSO** (recommended): Leave password blank, SST will open browser
- **Password**: Set `SNOWFLAKE_PASSWORD=your_password`
- **RSA Key**: Set `SNOWFLAKE_PRIVATE_KEY_PATH=/path/to/key.pem`

### 4. Configure dbt Profile

Create or update `~/.dbt/profiles.yml`:

```yaml
jaffle_shop:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: "{{ env_var('SNOWFLAKE_ACCOUNT') }}"
      user: "{{ env_var('SNOWFLAKE_USER') }}"
      password: "{{ env_var('SNOWFLAKE_PASSWORD', '') }}"
      role: "{{ env_var('SNOWFLAKE_ROLE') }}"
      warehouse: "{{ env_var('SNOWFLAKE_WAREHOUSE') }}"
      database: jaffle_shop
      schema: dev
      threads: 4
```

Update `dbt_project.yml` profile setting:
```yaml
profile: jaffle_shop  # Or whatever profile name you chose
```

### 5. Set Up Jaffle Shop Data

Create database and load sample data:

```bash
# In Snowflake, create database
CREATE DATABASE jaffle_shop;

# Load seed data using dbt
dbt seed --full-refresh --vars '{"load_source_data": true}'

# Build dbt models
dbt run
```

### 6. Copy SST Configuration

```bash
cp sst_config.yml.example sst_config.yml
```

The default configuration should work as-is for this project.

### 7. Compile dbt Manifest

SST uses dbt's manifest to understand your models:

```bash
dbt compile
# Creates target/manifest.json
```

### 8. Validate SST Setup

Test that SST is configured correctly:

```bash
sst validate
```

You should see:
```
HH:MM:SS  Running with sst=0.1.0
HH:MM:SS  Starting validation...
HH:MM:SS  Validation completed in X.Xs [OK]
```

---

## Project Structure

After setup, your project should look like:

```
sst-jaffle-shop/
├── dbt_project.yml              # dbt configuration
├── sst_config.yml               # SST configuration (copy from .example)
├── .env                         # Snowflake credentials (copy from .example, DON'T COMMIT!)
├── models/                      # dbt models (from Jaffle Shop)
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_orders.sql
│   │   └── ...
│   └── marts/
│       ├── customers.sql
│       ├── orders.sql
│       └── ...
├── snowflake_semantic_models/   # SST semantic layer (TO BE BUILT)
│   ├── metrics/
│   ├── relationships/
│   ├── filters/
│   ├── custom_instructions/
│   ├── verified_queries/
│   └── semantic_views.yml
├── seeds/                       # Sample CSV data
└── docs/                        # Documentation
    └── SETUP.md                 # This file
```

---

## Next Steps

Now that setup is complete, you can:

1. **Explore the dbt models** - Review `models/marts/` to understand the data structure
2. **Create semantic models** - Add YAML files to `snowflake_semantic_models/`
3. **Enrich metadata** - Run `sst enrich models/marts/` to auto-populate metadata
4. **Deploy to Snowflake** - Run `sst deploy --db JAFFLE_SHOP --schema SEMANTIC_VIEWS`

---

## Troubleshooting

### "Failed to connect to Snowflake"

- Verify `.env` variables are set correctly
- Test with `sst extract --verbose` to see connection details
- Ensure your Snowflake account URL is correct

### "manifest.json not found"

- Run `dbt compile` to generate the manifest
- Ensure you're in the project root directory

### "No models found"

- Check `sst_config.yml` paths match your directory structure
- Verify `dbt_project.yml` exists in project root

---

## Resources

- [SST Documentation](https://github.com/WhoopInc/snowflake-semantic-tools/tree/main/docs)
- [Original Jaffle Shop](https://github.com/dbt-labs/jaffle-shop)
- [dbt Documentation](https://docs.getdbt.com/)

---

**Ready to build the semantic layer!**
