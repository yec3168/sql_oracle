select city, length(city)
from (select city, length(city)
         from station
         order by 2 desc , 1)
where rownum =1;

select city, length(city)
from (select city, length(city)
         from station
         order by 2 , 1)
where rownum =1;
