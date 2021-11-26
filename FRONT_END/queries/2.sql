with t1 as (
    select si.code_module, si.code_presentation, count(distinct si.id_student) as "pass"
    from studentInfo as si
    where si.final_result='Pass'
    group by si.code_module, si.code_presentation
),
t2 as (
    select si.code_module, si.code_presentation, count(distinct si.id_student) as "fail"
    from studentInfo as si
    where si.final_result='Fail'
    group by si.code_module, si.code_presentation
),
t3 as (
    select si.code_module, si.code_presentation, count(distinct si.id_student) as "withdraw"
    from studentInfo as si
    where si.final_result='Withdrawn'
    group by si.code_module, si.code_presentation
)
select t1.code_module, t1.code_presentation, t1.pass, t2.fail, t3.withdraw
from t1, t2, t3
where t1.code_module = t2.code_module
and t1.code_presentation = t2.code_presentation
and t3.code_module = t2.code_module
and t3.code_presentation = t2.code_presentation
order by t1.code_module, t2.code_presentation;