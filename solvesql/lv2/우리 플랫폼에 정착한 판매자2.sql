select seller_id, count(DISTINCT order_id) as orders
from olist_order_items_dataset 
where price >= 50
group by seller_id
HAVING count(DISTINCT order_id) >= 100
order by 2 desc
