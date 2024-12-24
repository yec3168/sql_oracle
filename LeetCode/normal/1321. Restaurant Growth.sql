/* Write your PL/SQL query statement below */
select to_char(visited_on+6, 'YYYY-MM-DD') as visited_on,
            -- sum(amount) over( order by visited_on ) 
            (select sum(amount)
             from customer c2
             where c2.visited_on between c1.visited_on and c1.visited_on+6 ) as amount,
            (select round(sum(amount)/7, 2)
             from customer c2
             where c2.visited_on between c1.visited_on and c1.visited_on+6 ) as average_amount 
from customer c1
where visited_on + 6 <= (select max(visited_on)
                        from customer)
group by visited_on
order by 1;
