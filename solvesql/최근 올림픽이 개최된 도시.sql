select year, upper(substr(city, 1, 3)) city
from games
where year >=2000
order by 1 desc