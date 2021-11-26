-- arg id_student=11391, module=AAA, presentation=2013J
select a.assessment_type, a.id_assessment, sa.score, sa.date_submitted, a.date as deadline
from assessments as a, studentAssessment as sa
where sa.id_student = argv[1]
and a.code_module = 'argv[2]'
and a.code_presentation = 'argv[3]'
and sa.id_assessment = a.id_assessment;
/*select assessment_type, count(assessment_type) as occurences
from assessments
where code_module = 'AAA' and code_presentation = '2013J' 
group by assessment_type;*/