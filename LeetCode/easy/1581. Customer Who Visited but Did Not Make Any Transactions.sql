/* Write your PL/SQL query statement below */
select v.customer_id  as customer_id ,
        count(v.visit_id) as count_no_trans 
from visits v full outer join transactions t on v.visit_id = t.visit_id    
where t.transaction_id is null
group by v.customer_id;
