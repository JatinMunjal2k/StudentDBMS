-- args codemodule, code-presentation, -col_name, --

SELECT argv[3], COUNT(*)
FROM studentInfo
WHERE code_module = 'argv[1]' AND code_presentation = 'argv[2]'
GROUP BY argv[3]
ORDER BY count DESC;

-- SELECT region, COUNT(*) FROM studentInfo
-- WHERE code_module = 'AAA' AND code_presentation = '2013J'
-- GROUP BY region
-- ORDER BY region;