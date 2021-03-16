-- https://www.hackerrank.com/challenges/weather-observation-station-9/problem
select distinct CITY
from STATION
where CITY
regexp ('^[^AEIOU]');
