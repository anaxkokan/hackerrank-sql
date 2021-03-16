-- https://www.hackerrank.com/challenges/weather-observation-station-11/problem
select distinct CITY
from STATION
where
    CITY regexp ('^[^aeiouAEIUO]') or
    CITY regexp ('[^aeiouAEIOU]$');
