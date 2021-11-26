-- arg for 
-- show id_student, studied credits, courses taken rn
with t as (
select id_student, count(*)*3 as credits_registered
from studentRegistration
where date_unregistration is null 
group by id_student
)
select t.*, si.studied_credits
from t, studentInfo as si
where t.id_student = si.id_student;

/* with t as (
select id_student, count(*) as courses_registered
from studentRegistration
where date_unregistration is null 
group by id_student
)
select t.*, si.studied_credits
from t, studentInfo as si
where t.id_student = si.id_student; */