select h.hacker_id, h.name, t.total
from(select hacker_id, sum(max_score) as total
    from (select hacker_id, challenge_id, max(score) as max_score
            from submissions
            group by hacker_id, challenge_id)
group by hacker_id
having sum(max_score) > 0) t inner join hackers h on t.hacker_id = h.hacker_id
order by 3 desc, 1;