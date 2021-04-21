--https://www.hackerrank.com/challenges/weather-observation-station-14/problem
select
    cast(max(lat_n) as decimal (10, 4))
from station
where lat_n < 137.2345;