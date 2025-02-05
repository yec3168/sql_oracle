with tt as(
    select *
    from employee e1 inner join (
                                SELECT employee_id as id, count(*) as cnt
                                FROM employee
                                group by employee_id
                                ) E2 ON E1.employee_id = e2.id

)
SELECT employee_id, department_id
FROM tt
where cnt = 1 or (cnt >1 and primary_flag = 'Y')

