select sum(c1.population)
from city c1 inner join country c2 on c1.countrycode = c2.code
where c2.CONTINENT  = 'Asia';