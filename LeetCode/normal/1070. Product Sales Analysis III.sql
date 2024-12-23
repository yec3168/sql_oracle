/* Write your PL/SQL query statement below */

-- select  customer_id, min(order_date)
-- from delivery
-- group by customer_id

with cnt as(
                select *
                from delivery
                where (customer_id, order_date) in (
                                                    select  customer_id, min(order_date)
                                                        from delivery
                                                        group by customer_id
                ) 
)

select round( 
    count( case when ORDER_DATE = customer_pref_delivery_date then 1 end) / count(*) * 100
    , 2) as immediate_percentage 
from cnt ;