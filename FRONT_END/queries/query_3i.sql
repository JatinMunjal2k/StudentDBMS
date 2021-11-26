-- arg for code_mod, code_present
select a.id_assessment,sa.id_student,sa.date_submitted,(sa.date_submitted-a.date) as late_by,sa.score
from studentAssessment as sa, assessments as a 
where sa.id_assessment = a.id_assessment and sa.date_submitted > a.date and code_module = 'argv[1]' and code_presentation = 'argv[2]'
order by  a.id_assessment ASC,(sa.date_submitted-a.date) DESC;
/*group by code_module, code_presentation*/
/*select code_module, code_presentation, count(*) as late_submissions
from studentAssessment as sa, assessments as a 
where sa.id_assessment = a.id_assessment and sa.date_submitted > a.date and code_module = 'AAA' and code_presentation = '2013J'
group by code_module, code_presentation*/