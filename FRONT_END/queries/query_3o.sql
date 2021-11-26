-- all other deletes cascaded --
DELETE FROM courses WHERE code_module = 'argv[1]' AND code_presentation = 'argv[2]';

/*
DELETE FROM assessments WHERE code_module = 'AAA' AND code_presentation = '2013J';
DELETE FROM studentRegistration WHERE code_module = 'AAA' AND code_presentation = '2013J';
DELETE FROM studentInfo WHERE code_module = 'AAA' AND code_presentation = '2013J';
DELETE FROM courses WHERE code_module = 'AAA' AND code_presentation = '2013J';
*/
/*BEGIN;
DELETE FROM courses WHERE code_module = 'XXX' AND code_presentation = '2015J';


CREATE TABLE course_log (  
	op varchar(2),  
	date_modified TIMESTAMPTZ,
	code_module varchar(45),
    code_presentation varchar(45),
    module_presentation_length int
);
*/
/*
CREATE OR REPLACE FUNCTION process_course_log() RETURNS TRIGGER AS $course_log_t$
    BEGIN
        --
        -- Create a row in emp_audit to reflect the operation performed on emp,
        -- make use of the special variable TG_OP to work out the operation.
        --
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO course_log SELECT 'D', now(),OLD.*;
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO course_log SELECT 'U', now(),NEW.*;
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO course_log SELECT 'I', now(),NEW.*;
            RETURN NEW;
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$course_log_t$ LANGUAGE plpgsql;

CREATE TRIGGER course_log_t
AFTER INSERT OR UPDATE OR DELETE ON courses
    FOR EACH ROW EXECUTE PROCEDURE process_course_log();
*/