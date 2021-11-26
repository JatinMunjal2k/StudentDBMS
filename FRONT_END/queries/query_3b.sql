-- args - codemodule, code-presentation, finalresult - pass, fail, distinction or withdraw--
SELECT id_student,gender,region,highest_education,	imd_band,	age_band,	num_of_prev_attempts,	studied_credits,	disability,	final_result
FROM studentInfo
WHERE code_module = 'argv[1]' AND code_presentation = 'argv[2]'
AND final_result = 'argv[3]'
ORDER BY id_student ASC;


-- SELECT * FROM studentInfo
-- WHERE code_module = 'AAA' AND code_presentation = '2013J'
-- AND final_result = 'Pass'
-- ORDER BY id_student ASC;
