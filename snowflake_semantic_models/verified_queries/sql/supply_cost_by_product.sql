SELECT
  {{ ref('products', 'product_name') }},
  SUM({{ ref('supplies', 'supply_cost') }}) AS total_supply_cost
FROM {{ ref('supplies') }}
JOIN {{ ref('products') }}
  ON {{ ref('supplies', 'product_id') }} = {{ ref('products', 'product_id') }}
GROUP BY 1
ORDER BY 2 DESC
