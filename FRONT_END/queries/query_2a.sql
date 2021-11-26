-- button for id_student and code_presentation
select code_module, code_presentation, date_registration,date_unregistration
from studentRegistration as sr
where id_student = argv[1]
/* 
select code_module, code_presentation
from studentRegistration as sr
where sr.date_unregistration is null and id_student = 11391
*/