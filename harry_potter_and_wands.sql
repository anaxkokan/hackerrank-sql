--https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
with non_evil as (
    
    select
        wands.id,
        wands_property.age,
        wands.coins_needed,
        wands.power
    from wands
    inner join wands_property on wands.code = wands_property.code
    where wands_property.is_evil = 0

),

min_coins_needed as (

    select
        age,
        power,
        min(coins_needed) as min_coins
    from non_evil
    group by age, power
    
),

final as (
    select non_evil.*
from non_evil
inner join min_coins_needed on 
    non_evil.age = min_coins_needed.age and
    non_evil.power = min_coins_needed.power and
    non_evil.coins_needed = min_coins_needed.min_coins

)

select * from final
order by power desc, age desc;