# SST Jaffle Shop

This is an educational project designed to teach you how to use [Snowflake Semantic Tools (SST)](https://github.com/WhoopInc/snowflake-semantic-tools) with dbt by leveraging the Jaffle Shop project.

This repository is a fork of the original [Jaffle Shop](https://github.com/dbt-labs/jaffle-shop) project. If you're interested in learning dbt without SST, please refer to the [dbt Labs supported version](https://github.com/dbt-labs/jaffle-shop).

## Branch Structure

| Branch | Description |
|--------|-------------|
| **`main`** | Clean slate version of the project. Use this branch to follow along with the tutorial and build everything from scratch. |
| **`complete-project`** | Fully implemented version with all semantic models, metrics, relationships, and semantic views already built out. Great for reference or integration testing SST. |

> **Tip:** If you're learning SST, start with `main`. If you're testing SST functionality or want to see a complete implementation, use `complete-project`.

## About Snowflake Semantic Tools

[Snowflake Semantic Tools](https://github.com/WhoopInc/snowflake-semantic-tools) is an open-source project developed by [WHOOP](https://whoop.com) that makes the Snowflake Semantic View creation process as close to the Business Analyst workflow as possible—all within dbt. This project is published on [PyPI](https://pypi.org/project/snowflake-semantic-tools/).

This project was created by the Analytics team at WHOOP to help data teams learn Snowflake Semantic Tools, familiarize themselves with Snowflake Semantic Views, and understand how to integrate the process with dbt workflows in a sandbox environment.

> **Note for Developers:** This project is also an excellent resource for integration testing and experimenting with future SST development. The well-structured dbt models and semantic layer definitions provide a stable foundation for testing new SST features and workflows.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [What You'll Learn](#what-youll-learn)
- [Project Structure](#project-structure)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Resources](#resources)

## Prerequisites

Before getting started, ensure you have:

- **Python 3.10 or 3.11**
- **Conda** (optional, for environment management)

> **Note:** The tutorial will walk you through setting up a Snowflake trial account, installing SST, and installing dbt Core.

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/WhoopInc/sst-jaffle-shop.git
   cd sst-jaffle-shop
   ```

2. **Follow the [tutorial](docs/TUTORIAL.md)** which will guide you through:
   - Setting up a Snowflake trial account
   - Installing SST and dbt Core
   - Configuring your environment
   - Loading sample data and building the project
   - Creating your first semantic models

The tutorial provides step-by-step instructions to get you up and running quickly!

## What You'll Learn

By working through this project, you'll learn how to:

- Set up and configure Snowflake Semantic Tools with dbt
- Create semantic views, metrics, and relationships in Snowflake
- Integrate SST workflows into your dbt project structure
- Use filters and custom instructions for semantic models
- Deploy and validate semantic views in Snowflake

## Project Structure

```
sst-jaffle-shop/
├── models/                      # dbt models
│   ├── staging/                 # Staging layer models
│   └── marts/                   # Marts layer models
├── snowflake_semantic_models/   # SST semantic layer definitions
│   ├── metrics/                 # Metric definitions
│   ├── relationships/           # Relationship definitions
│   ├── filters/                 # Filter definitions
│   ├── custom_instructions/     # Business rules and instructions
│   ├── verified_queries/        # Verified query examples
│   └── semantic_views.yml       # Semantic view configuration
├── seeds/                       # Seed data files
│   └── jaffle-data/              # Sample Jaffle Shop data
├── macros/                      # dbt macros
├── analyses/                    # dbt analyses
├── data-tests/                  # dbt data tests
├── docs/                        # Additional documentation
│   ├── TUTORIAL.md              # Step-by-step tutorial guide
│   └── SETUP.md                 # Detailed setup instructions
├── dbt_project.yml              # dbt project configuration
├── packages.yml                 # dbt package dependencies
├── requirements.txt             # Python dependencies (SST, dbt-snowflake)
└── sst_config.yml              # SST configuration file
```

## Documentation

- **[Tutorial](docs/TUTORIAL.md)** - Step-by-step guide to get started with SST
- **[Setup Guide](docs/SETUP.md)** - Detailed setup and configuration instructions
- **[Snowflake Semantic Tools](https://github.com/WhoopInc/snowflake-semantic-tools)** - Main SST repository and documentation

## Contributing

Contributions are welcome to both this project and the [Snowflake Semantic Tools source code](https://github.com/WhoopInc/snowflake-semantic-tools)! 

If you find issues or have suggestions for improvements, please:
- Open an issue in this repository
- Submit a pull request with your changes
- Share feedback and ideas with the community

## Resources

- [Snowflake Semantic Tools GitHub](https://github.com/WhoopInc/snowflake-semantic-tools)
- [Snowflake Semantic Tools on PyPI](https://pypi.org/project/snowflake-semantic-tools/)
- [Original Jaffle Shop Project](https://github.com/dbt-labs/jaffle-shop)
- [dbt Documentation](https://docs.getdbt.com/)
- [Snowflake Semantic Views Documentation](https://docs.snowflake.com/en/user-guide/views-semantic/overview)