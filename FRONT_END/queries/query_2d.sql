--not tested--
--args studentid, module, pres, date of unregistration--
DELETE FROM studentInfo
WHERE id_student = argv[1] AND code_module = 'argv[2]' AND code_presentation = 'argv[3]' AND final_result = NULL;

--this triggers this -- 
UPDATE studentRegistration
SET date_unregistration = argv[4]
WHERE id_student = argv[1] AND code_module = 'argv[2]' AND code_presentation = 'argv[3]'
