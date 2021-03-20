--https://www.hackerrank.com/challenges/challenges/problem
with challenges_won as (
    
    select 
        hackers.hacker_id,
        hackers.name,
        challenges.challenge_id
    from hackers
    inner join challenges on hackers.hacker_id = challenges.hacker_id
    
),

number_of_challenges_won as (


    select 
        hacker_id,
        name,
        count(*) as number_of_challenges
    from challenges_won
    group by hacker_id, name
    
),

hackers_per_number_of_challenges as (
    
    select 
        number_of_challenges,
        count(*) as hackers_challenges
    from number_of_challenges_won
    group by number_of_challenges
    
 ),
 
nums_to_keep as (
 
    select
        number_of_challenges,
        case
            when hackers_challenges = 1 then 1
            when number_of_challenges = (select max(number_of_challenges) from hackers_per_number_of_challenges) then 1      
            else 0
        end as keep
    from hackers_per_number_of_challenges
    
),

final as (

    select
        number_of_challenges_won.*
    from number_of_challenges_won
    inner join nums_to_keep
        on number_of_challenges_won.number_of_challenges = nums_to_keep.number_of_challenges
    where keep = 1

)

select *
from final
order by number_of_challenges desc, hacker_id;

