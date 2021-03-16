-- https://www.hackerrank.com/challenges/weather-observation-station-10/problem
select distinct CITY
from STATION
where CITY
regexp  ('[^aeiou]$');
