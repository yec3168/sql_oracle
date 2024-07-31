select *
from tips
where day in (
    select day
    from tips
    group by day
    HAVING sum(total_bill) >= 1500
)