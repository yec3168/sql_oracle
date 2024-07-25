select member_name, review_text, to_char(review_date, 'YYYY-MM-DD') as REVIEW_DATE
from (
        select r.member_id, count(r.member_id) as count, member_name
        from member_profile m inner join rest_review r on m.member_id = r.member_id
        group by r.member_id, member_name
     ) c inner join rest_review r on c.member_id = r.member_id
where count = (
                select max(count(member_id)) 
                from rest_review 
                group by member_id
              )
order by 3, 2