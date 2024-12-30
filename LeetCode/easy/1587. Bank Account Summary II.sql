/* Write your PL/SQL query statement below */
with tr as(
    select account, sum(amount) as amount
    from Transactions
    group by account
)

select u.name,
        t.amount as balance    
from users u join tr t on u.account = t.account
where t.amount > 10000
