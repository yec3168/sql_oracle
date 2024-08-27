/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select round(sqrt(power(c-a, 2) + power(d-b, 2)),4)
from(select min(lat_n) as a, min(long_w) as b, max(lat_n) as c, max(long_w) as d
    from station);
