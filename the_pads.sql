--https://www.hackerrank.com/challenges/the-pads/problem
with names as (
    
    select 
        concat(name, "(", substring(occupation, 1, 1), ")" ) as professionals
    from occupations
    order by name offset 0 rows 

),

occupation_count as (
    
    select
        occupation,    
        count(occupation) as occupation_num,
        concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.') as occupation_total
    from occupations
    group by occupation
    
),

final as (
    
    select * from occupation_count
    order by 
        occupation_num, 
        occupation 
    offset 0 rows
    
)

select professionals from names
union all
select occupation_total from final;