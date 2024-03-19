SELECT 
    products_id
    ,date_date
    ,orders_id
    ,revenue
    ,quantity
    CAST (purchase_price AS FLOAT64)
    ,ROUND (s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_price
    ,s.revenue - ROUND (s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
FROM {{ref("stg_raw_sales")}} s
LEFT JOIN {{ref("stg_raw_product")}} p
    USING (products_id)