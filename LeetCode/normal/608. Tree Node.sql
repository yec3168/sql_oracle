/* Write your PL/SQL query statement below */

with leaf_cnt as (
    select p_id, count(id) as cnt
    from tree
    group by p_id
) 

select id,
    (case when t.p_id is null  then 'Root'
          when l.p_id is not null and l.cnt is not null then 'Inner'
          else 'Leaf'
          end) as "Type"
from tree t left join leaf_cnt l on t.id = l.p_id;
