select request_at as Day,
        round( (count(case when status != 'completed' then 1 end) / count(*) ), 2) as "Cancellation Rate"
from trips
where   (client_id) in ( select users_id
                           from users
                            where role = 'client' and banned = 'No') and
        (driver_id) in ( select users_id
                          from users
                           where role = 'driver' and banned = 'No')  and 
        request_at between '2013-10-01' and '2013-10-03'
group by request_at