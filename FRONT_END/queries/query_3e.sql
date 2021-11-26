-- args codemodule, code-presentation, -col_name, --
/*SELECT * FROM studentAssessment
WHERE code_module = argv[0] AND code_presentation = argv[1]
*/
SELECT SA.id_student,SA.is_banked, SA.date_submitted,(SA.date_submitted - A.date) as days_late, SA.score 
FROM studentAssessment as SA, assessments as A, studentInfo as SI 
WHERE SI.code_module = 'argv[1]' AND SI.code_presentation = 'argv[2]'
AND SA.id_assessment = 'argv[3]' AND SA.id_student = SI.id_student
AND SA.id_assessment = A.id_assessment AND SI.code_module = A.code_module AND SI.code_presentation = A.code_presentation
AND SA.date_submitted > A.date;
/*
SELECT SA.id_student,SA.is_banked, SA.date_submitted,(SA.date_submitted - A.date) as days_late, SA.score  FROM studentAssessment as SA, assessments as A, studentInfo as SI 
WHERE SI.code_module = 'AAA' AND SI.code_presentation = '2013J'
AND SA.id_assessment = 1752 AND SA.id_student = SI.id_student
AND SA.id_assessment = A.id_assessment AND SI.code_module = A.code_module AND SI.code_presentation = A.code_presentation
AND SA.date_submitted > A.date;
*/