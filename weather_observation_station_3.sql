-- https://www.hackerrank.com/challenges/weather-observation-station-3/problem
select distinct CITY
from station
where ID % 2 = 0;
