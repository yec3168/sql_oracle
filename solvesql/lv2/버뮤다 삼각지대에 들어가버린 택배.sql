SELECT  strftime('%Y-%m-%d',order_delivered_carrier_date) as delivered_carrier_date , count(DISTINCT customer_id) as orders 
from olist_orders_dataset  
where strftime('%Y-%m',order_delivered_carrier_date) = '2017-01' and order_delivered_customer_date ISNULL
GROUP BY strftime('%Y-%m-%d',order_delivered_carrier_date)
order by 1 
