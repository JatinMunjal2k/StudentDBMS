-- button for withdrawn number --
with t1 as (
    select code_module,code_presentation,count(id_student)
    from studentInfo 
    where final_result = 'argv[1]'
    group by code_module, code_presentation
),
t2 as (
    select code_module,code_presentation,count(id_student)
    from studentInfo 
    group by code_module, code_presentation
)
select t1.code_module, t1.code_presentation, round ( cast(t1.count as numeric) / cast(t2.count as numeric), 2) as rate
from t1,t2
where t1.code_module=t2.code_module
and t1.code_presentation=t2.code_presentation
order by rate desc;
/*select code_module,code_presentation,count(id_student)
from studentInfo 
where final_result = 'argv[1]'
group by code_module, code_presentation
order by count(id_student) desc
(cast(t1.count as float)*100/cast(t2.count as float))
(t1.count*100/t2.count)*/