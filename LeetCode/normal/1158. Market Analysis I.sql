/* Write your PL/SQL query statement below */

select u.user_id as buyer_id,
        to_char(join_date, 'YYYY-MM-DD') as join_date,
        count(o.item_id) as orders_in_2019
from users u left join (
                        select *
                        from orders
                        where to_char(order_date, 'YYYY') = '2019' 
                        ) o on u.user_id = o.buyer_id
group by u.user_id, join_date

