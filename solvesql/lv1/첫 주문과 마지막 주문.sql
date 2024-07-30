select
  date( FIRST_VALUE(order_purchase_timestamp) OVER ())AS first_order_date,
  date(LAST_VALUE(order_purchase_timestamp) OVER ()) AS last_order_date
from
  olist_orders_dataset
limit
  1