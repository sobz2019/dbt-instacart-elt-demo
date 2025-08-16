{{ config(
    materialized='table',
    cluster_by=['customer_id']
) }}

SELECT
  customer_id,
  COUNT(DISTINCT order_id)                               AS total_orders,
  COUNT(*)                                               AS total_items,
  COUNT(*) * 1.0 / NULLIF(COUNT(DISTINCT order_id), 0)   AS avg_items_per_order,
  MIN(order_sequence)                                    AS first_order_number,
  MAX(order_sequence)                                    AS last_order_number,
  MAX(order_id)                                          AS last_order_id,
  CASE WHEN COUNT(DISTINCT order_id) = 1 THEN 1 ELSE 0 END AS is_new_customer
FROM {{ ref('int_order_details') }}
GROUP BY customer_id