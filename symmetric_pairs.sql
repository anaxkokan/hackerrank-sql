--https://www.hackerrank.com/challenges/symmetric-pairs/problem
with different as (
    
    select 
    this.x,
    this.y
    from  functions as this 
    inner join functions as other 
    on this.x = other.y and this.y = other.x
    where this.x < this.y
   
    
),

same_count as (
    
    select
        x,
        y,
        count(x) as same_x
    from functions
    where x = y
    group by x, y

),

keep as (
    
    select 
        x,
        y,
        case 
            when same_x >1 then 'yes'
            else 'no'
        end as to_keep
    from same_count
    
),

final as (
    
    select x, y from different
    union all
    select x, y from keep
    where to_keep = 'yes'
)

select * from final
order by x;


    

