select event_date_kst as dt, count(DISTINCT user_pseudo_id) as users
from ga
where event_date_kst BETWEEN '2021-08-02' AND '2021-08-09'
GROUP by event_date_kst
order by 1