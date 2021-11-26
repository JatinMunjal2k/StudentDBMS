-- distinction number in courses
with t as (
SELECT SA.id_student, A.code_module, A.code_presentation, (SUM(SA.score * A.weight))/100 as Total_assignment_marks 
FROM studentAssessment as SA, assessments as A
WHERE SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')
AND SA.score IS NOT NULL
GROUP BY sa.id_student, A.code_module, A.code_presentation
ORDER BY SUM(SA.score * A.weight)/100 DESC )

select code_module,code_presentation,count(*)
from t
where Total_assignment_marks  > 75 
group by code_module, code_presentation
order by count desc
   
