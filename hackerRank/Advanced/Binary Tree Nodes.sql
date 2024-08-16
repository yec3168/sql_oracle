/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select n,  (case when  p IS NULL then 'Root' 
                    when  n in (select p
                                        from BST)  then 'Inner'
                    else 'Leaf' end)
from BST
order by 1;