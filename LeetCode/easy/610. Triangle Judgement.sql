/* Write your PL/SQL query statement below */


select  x , y , z, (case when x+y < z or x+z < z or y + z < x then 'No' ELSE 'Yes' end) as triangle 
from Triangle