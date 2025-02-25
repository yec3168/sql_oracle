/* Write your PL/SQL query statement below */
select s.user_id,
        case   
            when  ( select count(*) from confirmations where user_id = s.user_id) = 0 then 0
            else round(count(c.user_id) /  ( select count(*) from confirmations where user_id = s.user_id), 2) 
        end as confirmation_rate 
from signups s left join ( select * from confirmations where action = 'confirmed') c on s.user_id = c.user_id
group by s.user_id;