--https://www.hackerrank.com/challenges/placements/problem
with students_salary as (
    
    select 
        students.id,
        students.name,
        packages.salary,
        friends.friend_id
    from students 
    inner join friends on students.id = friends.id 
    inner join packages
    on students.id = packages.id
    
),

final as (

    select
        students_salary.*,
        packages.salary as friends_salary
    from students_salary 
    inner join packages
    on students_salary.friend_id = packages.id
    
)

select name
from final
where friends_salary > salary
order by friends_salary;