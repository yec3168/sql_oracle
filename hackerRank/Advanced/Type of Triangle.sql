/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select (case   when  A+B < C or A+C < B or B+C < A then 'Not A Triangle'
                    when A = B and B =C then 'Equilateral' 
                    when 
        A = B and B != C or
        A = C  and  B != C or
        B =C and A != B
        then 'Isosceles'  
                    else  'Scalene' end)
from TRIANGLES ;



/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select (case   when  A+B < C or A+C < B or B+C < A then 'Not A Triangle'
                    when A = B and B =C then 'Equilateral' 
                    when 
        A = B and B != C or
        A = C  and  B != C or
        B =C and A != B
        then 'Isosceles'  
                    else  'Scalene' end)
from TRIANGLES ;