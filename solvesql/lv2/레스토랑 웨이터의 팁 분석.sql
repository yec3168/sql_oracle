SELECT day, time, round(avg(tip), 2) as avg_tip, round(avg(size), 2) as avg_size
from tips
GROUP by day, time
order by 1, 2

--각 요일의 시간대별 평균 팁은 얼마인지
--평균 일행 수는 몇 명인지