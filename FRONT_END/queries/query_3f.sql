--args - codemodule, code-presentation, student id --

SELECT * FROM StudentInfo
WHERE code_module = 'argv[1]'
AND code_presentation = 'argv[2]'
AND id_student = argv[3];

SELECT SA.*,A.date as last_date,A.weight as weightage, A.assessment_type
FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'argv[1]'
AND A.code_presentation = 'argv[2]'
AND SA.id_student = argv[3]
AND SA.id_assessment = A.id_assessment
ORDER BY A.date ASC;

/*
SELECT * FROM StudentInfo
WHERE code_module = 'AAA' AND code_presentation = '2013J' AND id_student = 11391;

SELECT SA.*,A.date as last_date,A.weight as weightage, A.assessment_type FROM studentAssessment as SA, assessments as A
WHERE A.code_module = 'AAA' AND A.code_presentation = '2013J' AND SA.id_student = 11391
AND SA.id_assessment = A.id_assessment
ORDER BY A.date ASC;
*/