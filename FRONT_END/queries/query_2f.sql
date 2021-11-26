-- arg for id_student

with t as (
SELECT code_module, code_presentation,SUM(SA.score * A.weight)/100 as Total_assignment_marks

FROM studentAssessment as SA, assessments as A
WHERE id_student = argv[1]



AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY code_module, code_presentation
ORDER BY SUM(SA.score * A.weight)/100 DESC

) ,

t2 as (
select t.code_module, t.code_presentation, t.Total_assignment_marks, case WHEN t.Total_assignment_marks > 90 THEN 'A'
            WHEN t.Total_assignment_marks  > 80 THEN 'B'
            WHEN t.Total_assignment_marks  > 70 THEN 'C'
            WHEN t.Total_assignment_marks  > 60 THEN 'D'
            WHEN t.Total_assignment_marks > 40 THEN 'E'
            ELSE 'F'
       END
from t

), 
t3 as (
select t2.*, case when t2.case = 'A' then 10
when t2.case= 'B' then 9
when t2.case= 'C' then 8
when t2.case= 'D' then 7
when t2.case= 'E' then 6
ELSE 0
end grade_point
from t2) 
select round(avg(t3.grade_point),2) as gpa from t3 ;

/* with t as (
SELECT code_module, code_presentation,SUM(SA.score * A.weight)/100 as Total_assignment_marks

FROM studentAssessment as SA, assessments as A
WHERE id_student = 114017



AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY code_module, code_presentation
ORDER BY SUM(SA.score * A.weight)/100 DESC

) ,

t2 as (
select t.code_module, t.code_presentation, t.Total_assignment_marks, case WHEN t.Total_assignment_marks > 90 THEN 'A'
            WHEN t.Total_assignment_marks  > 80 THEN 'B'
            WHEN t.Total_assignment_marks  > 70 THEN 'C'
            WHEN t.Total_assignment_marks  > 60 THEN 'D'
            WHEN t.Total_assignment_marks > 40 THEN 'E'
            ELSE 'F'
       END
from t

), 
t3 as (
select t2.*, case when t2.case = 'A' then 10
when t2.case= 'B' then 9
when t2.case= 'C' then 8
when t2.case= 'D' then 7
when t2.case= 'E' then 6
ELSE 0
end grade_point
from t2) 
select avg(t3.grade_point) as gpa from t3 ;
 */
