WITH prod AS (SELECT * FROM {{ source('instacart_raw','products') }}),
ais  AS (SELECT * FROM {{ ref('stg_aisles') }}),
dep  AS (SELECT * FROM {{ ref('stg_departments') }})
SELECT
  p.product_id,
  p.product_name,
  p.aisle_id,
  a.aisle_name,
  p.department_id,
  d.department_name
FROM prod p
LEFT JOIN ais a  ON p.aisle_id = a.aisle_id
LEFT JOIN dep d  ON p.department_id = d.department_id