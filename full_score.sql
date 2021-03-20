--https://www.hackerrank.com/challenges/full-score/problem
with challenges_max as (

    select 
      challenges.challenge_id,
      difficulty.score as max_score
    from challenges
    inner join difficulty on challenges.difficulty_level = difficulty.difficulty_level

),

perfect_scores as (

    select
        submissions.hacker_id,
        submissions.score
    from submissions
    inner join challenges_max on submissions.challenge_id = challenges_max.challenge_id
    where submissions.score = challenges_max.max_score

),

perfect_scores_count as (
    
    select
        hacker_id,
        count(*) as num_perfect
    from perfect_scores
    group by hacker_id
    
),

final as (

    select
        perfect_scores_count.hacker_id,
        hackers.name,
        perfect_scores_count.num_perfect
    from perfect_scores_count 
    inner join hackers on perfect_scores_count.hacker_id = hackers.hacker_id
    where perfect_scores_count.num_perfect > 1
    
)

select
    hacker_id,
    name
from final
order by num_perfect desc, hacker_id;