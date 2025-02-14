/* Write your PL/SQL query statement below */

SELECT ID,
    CASE 
         WHEN NEXT IS NULL AND MOD(ID, 2) =1 THEN STUDENT
         WHEN MOD(ID, 2) = 1 THEN NEXT
         WHEN MOD(ID, 2) = 0 THEN PRE
    END AS STUDENT
FROM (
    select id,
            student,
            lag(STUDENT  ) over(order by id) as pre,
            lead(STUDENT) over(order by id) as next
    from seat
)

