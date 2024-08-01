select total_bill, tip, sex, smoker, t1.day, time, size
from tips as t1 inner join ( select day, max(total_bill) as max
                      FROM tips
                      GROUP BY day) as t2 on t1.day = t2. day and t1.total_bill = t2.max