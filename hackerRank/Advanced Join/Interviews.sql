/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with tt as(
    select ct.contest_id as contest_id
                , ct.hacker_id as hacker_id
                , ct.name as name
                , sum(nvl(sub.total_submissions,0)) as total_submissions
                , sum(nvl(sub.total_accepted_submissions, 0)) as total_accepted_submissions
                , sum(nvl(vs.total_views, 0)) as total_views
                , sum(nvl(vs.total_unique_views,0)) as total_unique_views 
    from contests ct left join Colleges cl on ct.contest_id = cl.contest_id
                     left join Challenges ch on cl.college_id  = ch.college_id 
                     left join (select challenge_id
                                        , sum(total_views) as total_views
                                        , sum(total_unique_views) as total_unique_views
                                from view_stats
                                group by challenge_id)vs on ch.challenge_id  = vs.challenge_id 
                     left join (select challenge_id
                                        , sum(total_submissions) as total_submissions
                                        , sum(total_accepted_submissions) as total_accepted_submissions
                                from Submission_Stats
                                group by challenge_id) sub on ch.challenge_id  = sub.challenge_id 
    group by ct.contest_id, ct.hacker_id, ct.name
)
select *
from tt
where total_views + total_unique_views + total_submissions + total_accepted_submissions != 0
order by contest_id;


--------------------------------------------------------------------------------------------------------------
/**
        아래는 실패코드.
**/


select distinct c1.contest_id
        , c1.hacker_id
        , c1.name
        , case when s.total_submissions is not null then s.total_submissions  else 0 end
        , case when s.total_accepted_submissions is not null then s.total_accepted_submissions  else 0 end
        , case when s.total_views is not null then s.total_views  else 0 end
        , case when s.total_unique_views is not null then s.total_unique_views  else 0 end
from (
        select c1.contest_id, c1.hacker_id, c1.name, c3.challenge_id
        from Contests c1, Colleges c2, Challenges c3
        where c1.contest_id = c2.contest_id 
            and c2.college_id = c3.college_id 
    ) c1 left join 
            (
            select challenge_id
                       , nvl(sum(total_submissions), 0) as total_submissions
                       , nvl(sum(total_accepted_submissions), 0) as total_accepted_submissions
                       , nvl(sum(total_views), 0) as total_views
                       , nvl(sum(total_unique_views), 0) as total_unique_views
                from(
                    select (case 
                                when v.challenge_id is null then s.challenge_id 
                                else v.challenge_id
                           end) as challenge_id
                           , total_submissions
                           , total_accepted_submissions
                           , total_views
                           , total_unique_views 
                    from View_Stats v full outer join Submission_Stats s on v.challenge_id = s.challenge_id
                    )
                group by challenge_id
             ) s on c1.challenge_id = s.challenge_id;
order by 1;
------ fail----------


with tt as(
    select ct.contest_id as contest_id
                , ct.hacker_id as hacker_id
                , ct.name as name
                , sum(nvl(sub.total_submissions,0)) as total_submissions
                , sum(nvl(sub.total_accepted_submissions, 0)) as total_accepted_submissions
                , sum(nvl(vs.total_views, 0)) as total_views
                , sum(nvl(vs.total_unique_views,0)) as total_unique_views 
    from contests ct left join Colleges cl on ct.contest_id = cl.contest_id
                     left join Challenges ch on cl.college_id  = ch.college_id 
                     left join view_stats vs on ch.challenge_id  = vs.challenge_id 
                     left join Submission_Stats sub on ch.challenge_id  = sub.challenge_id 
    group by ct.contest_id, ct.hacker_id, ct.name
)
select *
from tt
where total_views + total_unique_views + total_submissions + total_accepted_submissions != 0
order by contest_id;


------fail------

with tt as(
    select ct.contest_id as contest_id
                , ct.hacker_id as hacker_id
                , ct.name as name
                , sum(nvl(s.total_submissions,0)) as total_submissions
                , sum(nvl(s.total_accepted_submissions, 0)) as total_accepted_submissions
                , sum(nvl(s.total_views, 0)) as total_views
                , sum(nvl(s.total_unique_views,0)) as total_unique_views 
    from contests ct left join Colleges cl on ct.contest_id = cl.contest_id
                     left join Challenges ch on cl.college_id  = ch.college_id 
                     left join (
                                 select challenge_id
                                           , sum(nvl(total_submissions,0)) as total_submissions
                                           , sum(nvl(total_accepted_submissions, 0)) as total_accepted_submissions
                                           , sum(nvl(total_views, 0)) as total_views
                                           , sum(nvl(total_unique_views,0)) as total_unique_views
                                    from(
                                            select (case 
                                                        when v.challenge_id is null then s.challenge_id 
                                                        else v.challenge_id
                                                   end) as challenge_id
                                                   , total_submissions
                                                   , total_accepted_submissions
                                                   , total_views
                                                   , total_unique_views 
                                            from View_Stats v full outer join Submission_Stats s on v.challenge_id = s.challenge_id
                                        )
                                    group by challenge_id
                                 ) s on ch.challenge_id = s.challenge_id
    group by ct.contest_id, ct.hacker_id, ct.name
)
select *
from tt
where total_views + total_unique_views + total_submissions + total_accepted_submissions != 0
order by contest_id;


-------fail---------

select *
from (
        select ct.contest_id as contest_id
                        , ct.hacker_id as hacker_id
                        , ct.name as name
                        , sum(nvl(sub.total_submissions,0)) as total_submissions
                        , sum(nvl(sub.total_accepted_submissions, 0)) as total_accepted_submissions
                        , sum(nvl(vs.total_views, 0)) as total_views
                        , sum(nvl(vs.total_unique_views,0)) as total_unique_views 
        from colleges cl inner join contests ct on cl.contest_id = ct.contest_id
                         left join challenges ch on cl.college_id = ch.college_id
                         left join view_stats vs on ch.challenge_id = vs.challenge_id
                         left join Submission_Stats sub on ch.challenge_id = sub.challenge_id 
        group by ct.contest_id, ct.hacker_id, ct.name--, ch.challenge_id
)
where total_views + total_unique_views + total_submissions + total_accepted_submissions != 0
order by contest_id;