select m1.measured_at as today, next_day, m1.pm10, next_pm10
from measurements as m1 inner join (
                                      select measured_at,  LEAD(measured_at) OVER() as next_day,  LEAD(pm10) OVER() as next_pm10
                                      from measurements 
                                    ) as m2 
                                    on m1.measured_at = m2.measured_at
where m1.pm10 < next_pm10