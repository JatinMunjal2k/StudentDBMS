/*
SELECT SA.id_assessment,SA.id_student, SA.score, A.weight
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'AAA' AND A.code_presentation = '2013J'
AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')
AND id_student = 721259;
*/

SELECT SA.id_student, SUM(SA.score * A.weight)/100 as Total_assignment_marks
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'AAA' AND A.code_presentation = '2013J'
AND SA.id_assessment = A.id_assessment AND (A.assessment_type = 'CMA' OR A.assessment_type = 'TMA')
AND SA.score IS NOT NULL
GROUP BY SA.id_student
ORDER BY SUM(SA.score * A.weight)/100 DESC, SA.id_student;

--ROUND(cast(SUM(SV.sum) as decimal)/COUNT(DISTINCT SV.id_student),2)--