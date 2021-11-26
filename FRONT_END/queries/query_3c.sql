--- INPUT code_module, code_presentation, col (gender/region/highest_education/imd_band), col_value, order by colname ---
SELECT id_student,gender,region,highest_education,	imd_band,	age_band,	num_of_prev_attempts,	studied_credits,	disability,	final_result
FROM studentInfo
WHERE code_module = 'argv[1]'
AND code_presentation = 'argv[2]'
AND argv[3] = 'argv[4]'
ORDER BY argv[5];

-- SELECT * FROM studentInfo
-- WHERE code_module = 'AAA' AND code_presentation = '2013J' AND gender = 'F'
-- ORDER BY region;