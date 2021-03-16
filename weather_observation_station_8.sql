-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem
select city
from station
where city
regexp ('^[AEIOU].*[aeiou]$');
