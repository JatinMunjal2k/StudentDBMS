-- arg for code_mod=AAA, code_prese=2013J, id_student=312537
with t as(
    SELECT row_number() over (ORDER BY (SUM(SA.score * A.weight)/100) DESC) as rank, SA.id_student,  SUM(SA.score * A.weight)/100 as Total_assignment_marks 

FROM studentAssessment as SA, assessments as A
WHERE A.code_module ='argv[2]'  AND A.code_presentation = 'argv[3]'
AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY SA.id_student
ORDER BY SUM(SA.score * A.weight)/100 DESC, SA.id_student
)
select rank
from t
where id_student = argv[1];