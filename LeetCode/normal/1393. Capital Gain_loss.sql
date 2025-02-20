/* Write your PL/SQL query statement below */

with result as (
    select stock_name,
            operation_day, 
            sum(case when operation = 'Buy' then -price 
                        else price end) 
                over( partition by stock_name order by operation_day ) as capital_gain_loss,
            row_number() over(partition by stock_name order by operation_day) as rn
             
    from stocks
)
select stock_name, CAPITAL_GAIN_LOSS 
from  result
where (stock_name, rn) in ( select stock_name, max(rn)
                             from result
                             group by stock_name)
                           



