SELECT
  products.product_name,
  SUM(supplies.supply_cost) AS total_supply_cost
FROM {{ ref('supplies') }}
JOIN {{ ref('products') }}
  ON supplies.product_id = products.product_id
GROUP BY 1
ORDER BY 2 DESC
