--
with project_start as (
    
    select main.start_date
    from projects as main 
    left join projects as previous on main.start_date = previous.end_date
    where previous.start_date is NULL
    
),

project_end as (
    
    
    select main.end_date
    from projects as main 
    left join projects as next on next.start_date = main.end_date
    where next.start_date is NULL

),

final as (
    
    select 
    start_date,
    min(end_date) as min_end_date
    from project_start
    full outer join project_end on start_date < end_date
    group by start_date
    
)

select * 
from final
order by 
    datediff(day, start_date, min_end_date), 
    start_date;