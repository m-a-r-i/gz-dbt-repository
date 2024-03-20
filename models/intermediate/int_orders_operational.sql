SELECT
  o.orders_id
  ,o.date_date
  ,ROUND(o.margin + s.shipping_fee - (s.logcost + CAST(s.ship_cost AS FLOAT64)),2) AS operational_margin 
  ,o.quantity
  ,o.revenue
  ,o.purchase_cost
  ,o.margin
  ,shipping_fee
  ,s.logcost
  ,CAST (s.ship_cost AS FLOAT64) AS ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s ON o.orders_id = s.orders_id
ORDER BY orders_id desc




-- Margem operacional = margem + taxa de envio - log_cost - ship_cost

-- Nota - A taxa de envio é quanto o cliente pagou pelo frete, enquanto o custo de frete é quanto custa para a empresa organizar o frete.