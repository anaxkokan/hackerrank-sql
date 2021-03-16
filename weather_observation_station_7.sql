-- https://www.hackerrank.com/challenges/weather-observation-station-7/problem
select distinct CITY
from STATION
where right(CITY, 1) in ('a', 'e', 'i', 'o', 'u');
