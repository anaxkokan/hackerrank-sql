-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem
select distinct CITY 
from STATION
where 
    CITY regexp ('^[^aeiouAEIOU]') and
    CITY regexp ('[^aeiouAEIOU]$');
    