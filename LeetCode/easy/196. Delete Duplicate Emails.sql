delete from person
where id not in ( 
                    select min(id)
                    from person
                    group by email
)

select player_id, event_date, LEAD(EVENT_DATE) OVER(ORDER BY EVENT_DATE) as next_date
from activity
where player_id in ( select player_id
                     from activity
                     group by player_id
                     having count(*) >= 2)
order by player_id, event_date
