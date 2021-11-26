-- button for fail number 
select code_module,code_presentation,count(id_student)
from studentInfo 
where final_result = 'Fail'
group by code_module, code_presentation
order by count(id_student) desc