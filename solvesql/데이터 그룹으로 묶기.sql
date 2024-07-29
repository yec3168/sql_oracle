SELECT quartet, round(AVG(x), 2)  x_mean, round(VARIANCE(x), 2) x_var, round(AVG(y), 2) y_mean,  round(VARIANCE(y), 2)  y_var
From points
GROUP BY quartet