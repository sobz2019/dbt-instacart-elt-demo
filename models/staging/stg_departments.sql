SELECT department_id, department AS department_name
FROM {{ source('instacart_raw','departments') }}