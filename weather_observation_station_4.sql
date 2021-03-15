--https://www.hackerrank.com/challenges/weather-observation-station-4/problem
select 
    (select count(CITY) from STATION) -
    (select count(distinct CITY) from STATION);
