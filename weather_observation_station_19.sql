--https://www.hackerrank.com/challenges/weather-observation-station-19/problem
with points as (
    
    select
        min(lat_n) as a,
        max(lat_n) as b,
        min(long_w) as c,
        max(long_w) as d
    from station
    
),

final as (
    
    select
        sqrt(power(b - a, 2) + power(d - c, 2)) as distance
    from points
    
)

select
    cast(distance as decimal(18, 4))
from final;
