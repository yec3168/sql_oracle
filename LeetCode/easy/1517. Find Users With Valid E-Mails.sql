/* Write your PL/SQL query statement below */

select *
from Users
where REGEXP_like(mail, '^[a-zA-Z]{1}[a-zA-Z0-9_.-]*@leetcode\.com$');