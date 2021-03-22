--https://www.hackerrank.com/challenges/earnings-of-employees/problem
with salary_months as (

    select 
        employee_id,
        salary * months as total_earnings
    from employee
    
),

grouped_earnings as (

    select 
        total_earnings,
        count(*) as num_employees
    from  salary_months
    group by total_earnings

),

final as (
    
    select 
        total_earnings,
        num_employees
    from grouped_earnings
    where total_earnings = (select max(total_earnings)from grouped_earnings)
    
)

select * from final;