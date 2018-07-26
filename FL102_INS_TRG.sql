--------------------------------------------------------
--  DDL for Trigger FL102_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL102_INS_TRG" 
 BEFORE INSERT
 ON FL102_OBJECTIVE_REFS
 FOR EACH ROW
begin
     select FL102_SEQ.nextval into :new.OBJECTIVE_ID from dual;
   end;
/
ALTER TRIGGER "FLOODMASTER"."FL102_INS_TRG" ENABLE;
