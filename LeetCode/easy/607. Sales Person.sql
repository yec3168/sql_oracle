/* Write your PL/SQL query statement below */

select s.name
from(select *
     from ( select * from Company where name like 'RED') c inner join orders o on c.com_id = o.com_id) o
     right join 
     SalesPerson s on s.sales_id = o.sales_id
where order_id is null
