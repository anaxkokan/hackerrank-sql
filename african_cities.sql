--https://www.hackerrank.com/challenges/african-cities/problem
select
    city.name
from city 
inner join country on city.countrycode = country.code and
country.continent = 'Africa';