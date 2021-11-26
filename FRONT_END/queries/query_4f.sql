-- button for pass number 
with t as (
select code_module,code_presentation,count(id_student) as num
from studentInfo 

group by code_module, code_presentation
order by count(id_student) desc  ),
t2 as (

select code_module,code_presentation, count(id_student) as num
from studentInfo 
where final_result = 'Pass'   
group by code_module, code_presentation
order by count(id_student) desc 
)
 
 select t2.code_module, t2.code_presentation, (t2.num * 100) /t.num  as percent
from t, t2
where t.code_module = t2.code_module and t.code_presentation = t2.code_presentation
 
