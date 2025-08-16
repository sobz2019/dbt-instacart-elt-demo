{{ config(
    materialized='table',
    cluster_by=['department_name']
) }}

SELECT
  department_name,
  COUNT(DISTINCT order_id)                               AS orders_count,
  COUNT(*)                                               AS total_items_sold,
  COUNT(DISTINCT customer_id)                            AS customers_count,
  COUNT(*) * 1.0 / NULLIF(COUNT(DISTINCT order_id), 0)   AS avg_items_per_order
FROM {{ ref('int_order_details') }}
GROUP BY department_name
