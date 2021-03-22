--https://www.hackerrank.com/challenges/contest-leaderboard/problem
with hackers_scores as (
    
    select
        hackers.hacker_id,
        submissions.challenge_id,
        submissions.score,
        submissions.submission_id
    from hackers
    inner join submissions on hackers.hacker_id = submissions.hacker_id
    
),

max_score as (

    select
        hacker_id,
        challenge_id,
        max(score) as max_score_per_challenge
    from hackers_scores
    group by challenge_id, hacker_id
    
),

sum_scores as (
    
    select
        hacker_id,
        sum(max_score_per_challenge) as sum_scores_per_hacker
    from max_score
    group by hacker_id
    
),

final as (
    
    select 
        hackers.hacker_id,
        hackers.name,
        sum_scores.sum_scores_per_hacker
    from hackers
    inner join sum_scores on hackers.hacker_id = sum_scores.hacker_id
    where sum_scores_per_hacker > 0
    
)

select *
from final
order by sum_scores_per_hacker desc, hacker_id;