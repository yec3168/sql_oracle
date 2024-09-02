select  name as CUSTOMERs
from Customers c left join Orders o on c.id = o.customerId
where o.customerId is null
