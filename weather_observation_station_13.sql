--https://www.hackerrank.com/challenges/weather-observation-station-13/problem
select
    cast(sum(lat_n) as decimal (10, 4))
from station
where 38.7880 < lat_n and lat_n < 137.2345;