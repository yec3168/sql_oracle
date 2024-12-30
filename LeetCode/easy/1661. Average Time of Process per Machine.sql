/* Write your PL/SQL query statement below */
with sums as(
    select machine_id, 
                process_id,
                sum(case when activity_type = 'end' then timestamp else -timestamp end) as processing_time 
                -- sum(case when activity_type  = 'end' then timestamp else -timestamp end) 
                --         over(order by activity_type ) as processing_time 
    from activity
    group by machine_id, process_id
)

select machine_id,
        round(sum(processing_time) / count(process_id), 3) as processing_time
from sums
group by machine_id;
