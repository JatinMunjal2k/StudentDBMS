--args - codemodule, code-presentation, order by col--
SELECT id_student,gender,region,highest_education,	imd_band,	age_band,	num_of_prev_attempts,	studied_credits,	disability,	final_result
FROM studentInfo as si
WHERE code_module = 'argv[1]' AND code_presentation = 'argv[2]'
ORDER BY argv[3] ASC;