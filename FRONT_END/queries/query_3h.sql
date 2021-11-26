SELECT id_assessment,date,assessment_type
FROM assessments
WHERE code_module = 'argv[1]' AND code_presentation = 'argv[2]';

-- SELECT SV.code_module,SV.code_presentation,SV.id_site,SV.date, ROUND(cast(SUM(SV.sum) as decimal)/COUNT(DISTINCT SV.id_student),2) as avg_sum_clicks 
-- FROM studentVle as SV
-- WHERE SV.code_module = argv[1] AND SV.code_presentation = argv[2] AND SV.id_site = argv[3]
-- GROUP BY SV.code_module,SV.code_presentation,SV.id_site,SV.date;
/*
SELECT id_assessment,date,assessment_type
FROM assessments
WHERE code_module = 'AAA' AND code_presentation = '2013J';

SELECT SV.code_module,SV.code_presentation,SV.id_site,SV.date, ROUND(cast(SUM(SV.sum) as decimal)/COUNT(DISTINCT SV.id_student),2) as avg_sum_clicks 
FROM studentVle as SV
WHERE SV.code_module = 'AAA' AND SV.code_presentation = '2013J' AND SV.id_site = 546614
GROUP BY SV.code_module,SV.code_presentation,SV.id_site,SV.date;
*/
/*
SELECT id_assessment,date,assessment_type
FROM assessments
WHERE code_module = 'AAA' AND code_presentation = '2013J';

SELECT SV.code_module,SV.code_presentation,SV.id_site,SV.date, ROUND(cast(SUM(SV.sum) as decimal)/COUNT(DISTINCT SV.id_student),2) as avg_sum_clicks 
FROM studentVle as SV
WHERE SV.code_module = 'AAA' AND SV.code_presentation = '2013J' AND SV.id_site = 546614

GROUP BY SV.code_module,SV.code_presentation,SV.id_site,SV.date;
*/