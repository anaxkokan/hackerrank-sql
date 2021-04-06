--https://www.hackerrank.com/challenges/what-type-of-triangle/problem
select
    case 
        when a = b and b = c then 'Equilateral'
        when a + b > c and (a = b or b = c or a = c) then 'Isosceles'
        when a != b and b != c and a != c and a + b > c then 'Scalene'
        else 'Not A Triangle'
    end as triangle_type
from triangles;