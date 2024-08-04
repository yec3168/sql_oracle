select region as 'Region',
      count(DISTINCT case when category = 'Furniture' then order_id end) as 'Furniture',
      count(DISTINCT case when category = 'Office Supplies' then order_id end) as 'Office Supplies',
      count(DISTINCT case when category = 'Technology' then order_id end) as 'Technology' 
from records
group by region
ORDER BY region