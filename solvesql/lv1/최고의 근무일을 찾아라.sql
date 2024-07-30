select day, round( sum(tip), 2) as tip_daily
from tips
GROUP by day
order by 2 desc
LIMIT 1