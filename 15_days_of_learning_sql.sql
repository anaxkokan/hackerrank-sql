--https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
with submissions_num as (

    select 
        submission_date,
        hacker_id,
        count(submission_id) submissions_per_day
    from submissions
    group by submission_date, hacker_id

),

total_days as (
    
    select
        this.submission_date,
        this.hacker_id,
        count(*) as so_far,
        day(this.submission_date)as days 
    from submissions_num as this
    left join submissions_num as previous on previous.submission_date <= this.submission_date
    and this.hacker_id = previous.hacker_id
    group by this.hacker_id, this.submission_date

),

hackers_per_day as (
    
    select
        submission_date,
        count(hacker_id) as hackers
    from total_days
    where so_far = days
    group by submission_date

),

max_submissions as (
    
    select
        submission_date,
        max(submissions_per_day) as max_num_submissions
    from submissions_num
    group by submission_date

),

hackers_max_submissions as (

    select
        submissions_num.submission_date,
        min(submissions_num.hacker_id) as hacker_id
    from max_submissions 
    inner join submissions_num
    on max_submissions.submission_date = submissions_num.submission_date 
    and max_submissions.max_num_submissions = submissions_num.submissions_per_day
    group by submissions_num.submission_date

),

final as ( 

    select 
        hackers_per_day.submission_date,
        hackers_per_day.hackers,
        hackers_max_submissions .hacker_id,
        hackers.name
    from hackers_per_day 
    inner join hackers_max_submissions on hackers_per_day.submission_date = hackers_max_submissions.submission_date
    inner join hackers on hackers.hacker_id = hackers_max_submissions.hacker_id

)
    
select * from final
order by submission_date;

