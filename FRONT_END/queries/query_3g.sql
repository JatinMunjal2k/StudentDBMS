-- arg for code_module, code_presentation

with t as (
SELECT SA.id_student,  SUM(SA.score * A.weight)/100 as Total_assignment_marks
  /*CASE
		WHEN SA.score IS NULL THEN
			0
		ELSE
			SA.score
		END case;*/
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'argv[1]' AND A.code_presentation = 'argv[2]'
AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY SA.id_student
ORDER BY SUM(SA.score * A.weight)/100 DESC, SA.id_student
), 
t1 as (
SELECT SA.id_student, avg(SA.score) as Total_assignment_marks
  /*CASE
		WHEN SA.score IS NULL THEN
			0
		ELSE
			SA.score
		END case;*/
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'argv[1]' AND A.code_presentation = 'argv[2]'
AND SA.id_assessment = A.id_assessment AND A.assessment_type = 'Exam'

GROUP BY SA.id_student
ORDER BY avg(SA.score) DESC, SA.id_student  
) 
select t.id_student, (t.Total_assignment_marks+t1.Total_assignment_marks)/2 as total_marks
from t, t1
where t.id_student = t1.id_student;
/*CASE WHEN Total_assignment_marks > 90 THEN 'A'
            WHEN Total_assignment_marks > 80 THEN 'B'
            WHEN Total_assignment_marks > 70 THEN 'C'
            WHEN Total_assignment_marks > 60 THEN 'D'
            WHEN Total_assignment_marks > 40 THEN 'E'
            ELSE 'F'
       END

*/
/* -- arg for code_module, code_presentation

with t as (
SELECT SA.id_student,  SUM(SA.score * A.weight)/100 as Total_assignment_marks

FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'CCC' AND A.code_presentation = '2014B'
AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')

GROUP BY SA.id_student
ORDER BY SUM(SA.score * A.weight)/100 DESC, SA.id_student
), 
t1 as (
SELECT SA.id_student, avg(SA.score) as Total_assignment_marks
 
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'CCC' AND A.code_presentation = '2014B'
AND SA.id_assessment = A.id_assessment AND A.assessment_type = 'Exam'

GROUP BY SA.id_student
ORDER BY avg(SA.score) DESC, SA.id_student  
) 
select t.id_student, (t.Total_assignment_marks+t1.Total_assignment_marks)/2 as total_marks
from t, t1
where t.id_student = t1.id_student;


*/
