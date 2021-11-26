--enroll new student --
-- should take atleast one course --
--same order as in site, argv[12] - date of registration-- 
INSERT INTO studentInfo VALUES ('argv[1]','argv[2]',argv[3],'argv[4]','argv[5]','argv[6]','argv[7]','argv[8]',argv[9],argv[10],'argv[11]',NULL);
INSERT INTO studentRegistration VALUES ('argv[1]','argv[2]',argv[3],argv[12],NULL);

-- INSERT INTO studentInfo VALUES ('XXX','2015J',99999,'F','India','HE Qualification','90-100%','55<=',0,240,	'N',NULL);
-- INSERT INTO studentRegistration VALUES ('XXX','2015J',99999,-10,NULL);
--for the first course, after that 
/*
create trigger student_check before INSERT on studentInfo
begin
   if new.id_student IN (SELECT ) then
      set new.age=old.age;
   else
      set new.age=new.age;
   end if;
end;
*/
/*
create trigger prevent_redundancy
before insert on studentInfo 
for each row 
execute procedure update_points() ;

create or replace function update_points()
returns trigger as 
$BODY$
begin 
    if EXISTS (select 1 FROM studentInfo WHERE id_student = new.id_student AND code_module = new.code_module AND code_presentation = new.code_presentation) then 
    RETURN NULL;
     else
    RETURN NEW;
    end if;
end;
$BODY$
LANGUAGE plpgsql;
*/