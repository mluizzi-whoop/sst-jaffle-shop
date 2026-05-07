SELECT
  {{ ref('products', 'product_name') }},
  COUNT({{ ref('order_items', 'order_item_id') }}) AS quantity_sold
FROM {{ ref('order_items') }}
JOIN {{ ref('products') }}
  ON {{ ref('order_items', 'product_id') }} = {{ ref('products', 'product_id') }}
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5
