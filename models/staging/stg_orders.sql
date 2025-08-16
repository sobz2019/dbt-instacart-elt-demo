WITH raw AS (
  SELECT * FROM {{ source('instacart_raw', 'orders') }}
)
SELECT
  order_id,
  user_id           AS customer_id,
  order_number      AS order_sequence,
  order_dow         AS order_day_of_week,
  order_hour_of_day,
  days_since_prior_order
FROM raw