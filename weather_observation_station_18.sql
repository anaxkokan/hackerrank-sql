--https://www.hackerrank.com/challenges/weather-observation-station-18/problem
with points as (
    
    select 
        min(lat_n) as a,
        min(long_w) as b,
        max(lat_n) as c,
        max(long_w) as d
    from station
    
),

final as (
    
    select
        round(abs(a-c) + abs(b-d), 4) as distance
    from points
    
)

select 
    cast(distance as decimal(18,4))
from final;