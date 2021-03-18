-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
select 
    COUNTRY.CONTINENT, 
    floor(avg(CITY.POPULATION))
from CITY inner join COUNTRY
on CITY.COUNTRYCODE = COUNTRY.CODE
group by COUNTRY.CONTINENT;
 