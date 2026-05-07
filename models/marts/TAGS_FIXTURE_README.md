# Tags Fixture

Tags require pre-existing Snowflake tag objects (CREATE TAG) to work.
Since the e2e test environment may not have these objects, tags are
demonstrated in orders.yml.commented_tags below but not in the active schema.

To test tags in a real environment:
1. CREATE TAG data_domain ALLOWED_VALUES 'sales', 'marketing', 'operations';
2. CREATE TAG sensitivity ALLOWED_VALUES 'public', 'internal', 'confidential';
3. Add `tags:` block back to orders.yml model config

Example YAML (table-level tags):
```yaml
config:
  meta:
    sst:
      tags:
        data_domain: sales
        sensitivity: internal
```

Example YAML (column-level tags):
```yaml
config:
  meta:
    sst:
      tags:
        pii_level: none
        cost_center: operations
```

The DDL generated is:
```sql
WITH TAG (data_domain = 'sales', sensitivity = 'internal')
```
