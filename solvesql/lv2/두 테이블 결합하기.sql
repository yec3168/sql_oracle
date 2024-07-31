select DISTINCT athlete_id
from events as e inner join records as r on e.id = r.event_id
where sport = 'Golf'