-- grouping by region, gender, disability, pass, fail,withdrawn --
-- if argv[1] = region or gender or disability
SELECT code_module, code_presentation, argv[1], COUNT(*)
FROM studentInfo
GROUP BY code_module, code_presentation, argv[1]
ORDER BY argv[1] ASC, count DESC,code_module, code_presentation;
-- else 
-- select code_module,code_presentation,count(id_student)
-- from studentInfo 
-- where final_result = 'argv[1]'
-- group by code_module, code_presentation
-- order by count(id_student) desc
 /*SELECT region, COUNT(*) FROM studentInfo
  WHERE code_module = 'AAA' AND code_presentation = '2013J'
 GROUP BY region
 ORDER BY region; */