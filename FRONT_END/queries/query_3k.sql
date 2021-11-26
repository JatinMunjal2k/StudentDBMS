--args - module, pres,pass percentage for assessment types TMA, CMA and exam--

/*SELECT * 
FROM studentAssessment as SA, (select id_student,assessment_type FROM assessments) as A
WHERE SA.code_module = argv[1] AND SA.code_presentation = argv[2]
AND (score >= argv[3] AND assessment_type = 'TMA') OR (score >= argv[4] AND assessment_type = 'CMA') OR (score > argv[5] AND assessment_type = 'Exam')
GROUP BY id_student
HAVING COUNT(*) = (SELECT COUNT(*) FROM assessments WHERE  SA.code_module = argv[1] AND SA.code_presentation = argv[2])
*/

SELECT id_student
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'argv[1]' AND A.code_presentation = 'argv[2]'
AND SA.id_assessment = A.id_assessment
AND ((score >= argv[3] AND assessment_type = 'TMA') OR (score >= argv[4] AND assessment_type = 'CMA') OR (score >= argv[5] AND assessment_type = 'Exam'))
GROUP BY SA.id_student
HAVING COUNT(*) = (SELECT COUNT(*) FROM assessments WHERE  code_module = 'argv[1]' AND code_presentation = 'argv[2]')
ORDER BY SA.id_student;

/*
SELECT id_student
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'DDD' AND A.code_presentation = '2013B'
AND SA.id_assessment = A.id_assessment
AND ((score >= 30 AND assessment_type = 'TMA') OR (score >= 30 AND assessment_type = 'CMA') OR (score > 30 AND assessment_type = 'Exam'))
GROUP BY SA.id_student
HAVING COUNT(*) = (SELECT COUNT(*) FROM assessments WHERE  code_module = 'DDD' AND code_presentation = '2013B')
ORDER BY SA.id_student;
*/
/*
SELECT *
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'AAA' AND A.code_presentation = '2013J'
AND SA.id_assessment = A.id_assessment AND A.assessment_type = 'Exam'
ORDER BY SA.id_assessment LIMIT 10;

SELECT DISTINCT(SA.id_assessment)
FROM studentAssessment as SA, assessments as A
WHERE SA.id_assessment = A.id_assessment AND A.assessment_type = 'Exam'
ORDER BY SA.id_assessment LIMIT 10;
*/