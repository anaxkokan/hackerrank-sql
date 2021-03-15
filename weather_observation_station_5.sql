-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem
(
    select  
        CITY,
        length(CITY)
    from STATION
    order by 
        length(CITY),
        CITY
    limit 1
)

union all

(
    select  
        CITY,
        length(CITY)
    from STATION
    order by 
        length(CITY) desc,
        CITY
    limit 1
);
