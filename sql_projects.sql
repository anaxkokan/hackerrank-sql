--https://www.hackerrank.com/challenges/sql-projects/problem
with project_start as (
    
    select main.start_date as project_start_date
    from projects as main 
    left join projects as previous on main.start_date = previous.end_date
    where previous.start_date is null
    
),

project_end as (
        
    select main.end_date
    from projects as main 
    left join projects as next on next.start_date = main.end_date
    where next.start_date is null

),

final as (
    
    select 
    project_start_date,
    min(end_date) as project_end_date
    from project_start
    full outer join project_end
    on project_start_date < end_date
    group by project_start_date
    
)

select * from final
order by 
    datediff(day, project_start_date, project_end_date),    
    project_start_date;