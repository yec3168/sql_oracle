SELECT a.name--r.athlete_id, t.team, count(DISTINCT t.team)
FROM records as r INNER JOIN teams as t ON r.team_id = t.id
                  inner join (SELECT * from games WHERE year >= 2000) as g on r.game_id = g.id
                  INNER JOIN athletes as a on r.athlete_id = a.id
WHERE medal is not null
group by r.athlete_id 
HAVING count( DISTINCT t.team) >=2
ORDER BY 1
--LIMIT 1000