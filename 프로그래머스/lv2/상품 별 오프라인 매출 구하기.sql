-- 코드를 입력하세요
SELECT p.product_code, (SUM(o.sales_amount*p.price)) as SALES
from product p inner join offline_sale o on p.product_id = o.product_id
group by p.product_code
order by SALES desc, product_code