-- code module, code presentation, id_assessment, assessment_type (Give 3 options TMA,CMA,Exam),submission date, weight --
INSERT INTO assessments VALUES ('argv[1]','argv[2]',argv[3],'argv[4]',argv[5],argv[6]);

/*trigger to check if course module and presentation are there in courses 
not required - checked by foreign key*/ 
/*
INSERT INTO assessments VALUES ('XXX','2015J',99999,'TMA',10,10);
*/
