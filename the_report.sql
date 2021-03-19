-- https://www.hackerrank.com/challenges/the-report/problem
select
    case
        when Grades.grade < 8 then NULL
        else Students.Name
    end as Name,
    Grades.Grade,
    Students.Marks
from Students
inner join Grades on
    Grades.Min_Mark <= Students.Marks and
    Students.Marks <= Grades.Max_Mark
order by Grade desc, Name, Marks;
