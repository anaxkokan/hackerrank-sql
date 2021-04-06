--https://www.hackerrank.com/challenges/interviews/problem
with college_contest as (
    
    select
        contests.*,
        colleges.college_id
    from contests
    inner join colleges on contests.contest_id = colleges.contest_id
    
),

challenge_college as (
    
    select
        college_contest.contest_id,
        college_contest.hacker_id,
        college_contest.name,
        challenges.challenge_id
    from college_contest
    inner join challenges on college_contest.college_id = challenges.college_id
    
),

views as (
    
    select 
        challenge_college.challenge_id,
        sum(view_stats.total_views) as views_sum,
        sum(view_stats.total_unique_views) as unique_views_sum 
    from challenge_college
    left join view_stats on challenge_college.challenge_id = view_stats.challenge_id
    group by challenge_college.challenge_id
    
),

submissions as (
    
    select 
        challenge_college.challenge_id,
        sum(total_submissions) as submissions_sum,
        sum (total_accepted_submissions) as accepted_sum 
    from challenge_college 
    left join submission_stats 
    on challenge_college.challenge_id = submission_stats.challenge_id
    group by challenge_college.challenge_id
    
),

challenges as (
    
    select 
        challenge_college.contest_id,
        challenge_college.hacker_id,
        challenge_college.name,
        sum(submissions.submissions_sum) as submissions_final,
        sum(submissions.accepted_sum) as accepted_final,
        sum(views.views_sum) as veiws_final,
        sum(views.unique_views_sum) as unique_views_final
    from challenge_college 
    inner join views on challenge_college.challenge_id = views.challenge_id
    inner join submissions on views.challenge_id = submissions.challenge_id
    group by 
        challenge_college.contest_id, 
        challenge_college.hacker_id,
        challenge_college.name
    
)

select
    contest_id,
    hacker_id,
    name,
    case 
        when submissions_final is null then 0
        else submissions_final
    end as submissions_final,
    case 
        when accepted_final is null then 0
        else accepted_final
    end as accepted_final,
    case 
        when veiws_final is null then 0
        else veiws_final
    end as veiws_final,
    case 
        when unique_views_final is null then 0
        else unique_views_final
    end as unique_views_final
from challenges
where submissions_final + accepted_final + veiws_final + unique_views_final > 0
order by contest_id;

