SELECT aisle_id, aisle AS aisle_name,aisle AS aisle_name2
FROM {{ source('instacart_raw','aisles') }}