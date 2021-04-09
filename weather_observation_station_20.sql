--https://www.hackerrank.com/challenges/weather-observation-station-20/problem
with rows_lat_n as (
    
    select 
        row_number() over(order by lat_n) as row_num,
        lat_n 
    from station
    
),

median_row as (

    select
        (count(row_num)+1)/2 as median_at
    from rows_lat_n
    
),

final as (
    
    select
        cast(lat_n as decimal (18,4)) as median
    from rows_lat_n 
    inner join median_row on rows_lat_n.row_num = median_row.median_at
    
)

select * from final;