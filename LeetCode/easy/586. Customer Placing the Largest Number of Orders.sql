/* Write your PL/SQL query statement below */
select customer_number
from orders
group by customer_number
having count(order_number) = (select max(cnt)
                                from(select customer_number, count(order_number) as cnt
                                        from orders
                                        group by customer_number))

