--https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem
select
    count(name) as large_cities
from city
where population > 100000;