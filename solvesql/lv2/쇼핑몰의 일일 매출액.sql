select  strftime('%Y-%m-%d',order_purchase_timestamp ) as dt, round(sum(payment_value ), 2 )as revenue_daily 
from olist_orders_dataset as o1 inner join olist_order_payments_dataset o2 on o1.order_id = o2.order_id
where strftime('%Y-%m-%d',order_purchase_timestamp ) >= '2018-01-01'
GROUP BY strftime('%Y-%m-%d',order_purchase_timestamp )
order by 1