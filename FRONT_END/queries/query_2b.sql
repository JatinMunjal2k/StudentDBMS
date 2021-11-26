-- arg for id_student --
-- all id_student's dont give output because null --

-- arg for id_student
-- all id_student's dont give output because null
with t as (
SELECT code_module, code_presentation,SUM(SA.score * A.weight)/100 as Total_assignment_marks

FROM studentAssessment as SA, assessments as A
WHERE id_student = argv[1]



AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY code_module, code_presentation
ORDER BY SUM(SA.score * A.weight)/100 DESC
) 

select t.code_module, t.code_presentation,t.Total_assignment_marks as total_marks,case WHEN t.Total_assignment_marks  > 90 THEN 'A'
            WHEN t.Total_assignment_marks> 80 THEN 'B'
            WHEN t.Total_assignment_marks  > 70 THEN 'C'
            WHEN t.Total_assignment_marks  > 60 THEN 'D'
            WHEN t.Total_assignment_marks  > 40 THEN 'E'
            ELSE 'F'
       END
from t

/*with t as (
SELECT code_module, code_presentation,SUM(SA.score * A.weight)/100 as Total_assignment_marks

FROM studentAssessment as SA, assessments as A
WHERE id_student = 11391



AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY code_module, code_presentation
ORDER BY SUM(SA.score * A.weight)/100 DESC
) 

select t.code_module, t.code_presentation,t.Total_assignment_marks as total_marks,case WHEN t.Total_assignment_marks  > 90 THEN 'A'
            WHEN t.Total_assignment_marks> 80 THEN 'B'
            WHEN t.Total_assignment_marks  > 70 THEN 'C'
            WHEN t.Total_assignment_marks  > 60 THEN 'D'
            WHEN t.Total_assignment_marks  > 40 THEN 'E'
            ELSE 'F'
       END
from t

*/

/*
with t as (
SELECT code_module, code_presentation,SUM(SA.score * A.weight)/100 as Total_assignment_marks

FROM studentAssessment as SA, assessments as A
WHERE id_student = argv[1]

AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY code_module, code_presentation
ORDER BY SUM(SA.score * A.weight)/100 DESC
) ,
t1 as (
SELECT  code_module, code_presentation,avg(SA.score) as Total_assignment_marks
 
FROM studentAssessment as SA, assessments as A
WHERE id_student = argv[1]

AND SA.id_assessment = A.id_assessment AND A.assessment_type = 'Exam'

GROUP BY code_presentation, code_module
ORDER BY avg(SA.score) DESC
) 
select tp.*, CASE WHEN total_marks > 90 THEN 'A'
            WHEN total_marks > 80 THEN 'B'
            WHEN total_marks > 70 THEN 'C'
            WHEN total_marks > 60 THEN 'D'
            WHEN total_marks > 40 THEN 'E'
            ELSE 'F'
       END
from (
     select t.code_module, t.code_presentation,(t.Total_assignment_marks+t1.Total_assignment_marks)/2 as total_marks
     from t, t1
     where t.code_module = t1.code_presentation and t.code_module=t1.code_module
) as tp
*/

