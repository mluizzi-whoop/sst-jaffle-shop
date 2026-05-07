SELECT
  DATE_TRUNC('DAY', {{ ref('orders', 'ordered_at') }}) AS order_date,
  COUNT({{ ref('orders', 'order_id') }}) AS daily_orders
FROM {{ ref('orders') }}
GROUP BY 1
ORDER BY 1
