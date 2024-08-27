/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select round(LONG_W, 4)
from station
where lat_n = (select min(lat_n) from station where lat_n > 38.7780);

