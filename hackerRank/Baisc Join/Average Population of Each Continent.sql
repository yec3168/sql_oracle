select  t.continent, FLOOR(avg(c.population))
from city c inner join country t on c.countrycode = t.code
group by t.continent;