--https://www.hackerrank.com/challenges/the-company/problem
with all_data as (
    
    select
        company.company_code,
        company.founder,
        lead_manager.lead_manager_code,
        senior_manager.senior_manager_code,
        manager.manager_code,
        employee.employee_code
    from company
    inner join lead_manager on company.company_code = lead_manager.company_code
    inner join senior_manager on lead_manager.company_code = senior_manager.company_code
    inner join manager on senior_manager.company_code = manager.company_code
    inner join employee on manager.company_code = employee.company_code
    group by 
        employee_code, 
        manager.manager_code, 
        company.company_code, 
        company.founder,
        lead_manager.lead_manager_code,
        senior_manager.senior_manager_code

),

final as (
    
    select
        company_code, 
        founder,
        count(distinct(lead_manager_code)) as  lead_count,
        count(distinct(senior_manager_code)) as senior_count,
        count(distinct(manager_code)) as manager_count,
        count(distinct(employee_code)) as employee_count
    from all_data
    group by company_code, founder
    
)

select * from final
order by company_code;

