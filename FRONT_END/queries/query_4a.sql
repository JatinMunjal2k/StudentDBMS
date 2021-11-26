-- button for withdrawn number 
select code_module,code_presentation,count(id_student)
from studentInfo 

group by code_module, code_presentation
order by count(id_student) desc