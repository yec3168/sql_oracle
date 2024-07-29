SELECT seller_id, count(DISTINCT order_id) as orders
from olist_order_items_dataset 
group by seller_id
HAVING count(DISTINCT order_id)  >= 100