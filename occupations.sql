--https://www.hackerrank.com/challenges/occupations/submissions
with doctors as (
    
    select * from
        (select name as Doctor
        from occupations 
        where occupation = 'Doctor') as doctors_select
    
),

doctors_rows as (
    
    select
        row_number() over(order by Doctor) row_num,
        Doctor
    from doctors

),

professors as (
    
    select * from
        (select name as Professor 
        from occupations 
        where occupation = 'Professor') as professor_select
    
),

professors_rows as (
    
    select
        row_number() over(order by Professor) row_num,
        Professor
    from professors

),

singers as (
    
    select * from
        (select name as Singer
        from occupations 
        where occupation = 'Singer') as singer_select
    
),

singers_rows as (
    
    select
        row_number() over(order by Singer) row_num,
        Singer
    from singers
    
),

actors as (
    
    select * from
        (select name as Actor
        from occupations 
        where occupation = 'Actor') as actor_select

),

actors_rows as (

     select
        row_number() over(order by Actor) row_num,
        Actor
    FROM actors

)

select 
    Doctor,
    Professor,
    Singer,
    Actor
from doctors_rows
full outer join professors_rows on doctors_rows.row_num = professors_rows.row_num
full outer join singers_rows on professors_rows.row_num = singers_rows.row_num
full outer join actors_rows on singers_rows.row_num = actors_rows.row_num;