select nvl(name, null) as name
from employee
where id in (
                select managerId
                from employee
                group by managerId
                having count(id) >= 5
);
