WITH orders AS (
  SELECT * FROM {{ ref('stg_orders') }}
),
items AS (
  SELECT * FROM {{ ref('stg_order_products') }}
),
prod AS (
  SELECT * FROM {{ ref('stg_products') }}
)
SELECT
  o.order_id,
  o.customer_id,
  o.order_sequence,
  o.order_day_of_week,
  o.order_hour_of_day,
  o.days_since_prior_order,
  i.product_id,
  p.product_name,
  p.department_name,
  p.aisle_name,
  i.add_to_cart_order,
  i.reordered
FROM orders o
JOIN items i   ON o.order_id = i.order_id
LEFT JOIN prod p ON i.product_id = p.product_id

