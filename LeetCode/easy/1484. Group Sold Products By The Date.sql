/* Write your PL/SQL query statement below */

select to_char(sell_date, 'YYYY-MM-DD') as sell_date  ,
        count(DISTINCT product) as num_sold,
        LISTAGG( product, ',') within group(order by product) as products
from (
    select distinct sell_date,  product
    from Activities
    group by sell_date, product
)
group by sell_date;