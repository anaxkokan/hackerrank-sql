--https://www.hackerrank.com/challenges/weather-observation-station-17/problem
with larger_than as (
    
    select
        long_w,
        lat_n
    from station
    where lat_n > 38.7780
    
),

minimal_lat as (
    
    select
        min(lat_n) as min_lat_n
    from larger_than
    
),

final as (
    
    select
        cast(larger_than.long_w as decimal (18, 4)) as long_w
    from larger_than
    inner join minimal_lat
    on larger_than.lat_n = minimal_lat.min_lat_n
    
)

select * from final;