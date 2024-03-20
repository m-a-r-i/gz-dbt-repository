SELECT 
   p.products_id, 
   s.date_date, 
   s.orders_id,
   s.revenue, 
   s.quantity, 
   p.purchase_price AS purchase_price,
   CAST(p.purchase_price AS FLOAT64)* CAST (s.quantity AS INT64),
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
   ROUND(s.revenue - s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__products")}} p ON p.products_id = s.products_id
 