select 
            c.company_code, 
            c.founder, 
            count(Distinct lead_manager_code), 
            count( Distinct senior_manager_code),  
            count(Distinct manager_code), 
            count(Distinct e.employee_code)
from Company c inner join employee e on c.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code;