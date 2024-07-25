select flavor
from(select j.flavor, j_sum+TOTAL_ORDER
     from(select distinct flavor, sum(total_order) over(partition by flavor) as j_sum
          from july) j inner join first_half f on j.flavor = f.flavor
     order by 2 desc)
where rownum <=3