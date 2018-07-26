--------------------------------------------------------
--  DDL for Trigger SF15_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF15_INS_TRG" 
 BEFORE INSERT
 ON SF15_CONDITION_ASSESSMENT_NOTE
 FOR EACH ROW
begin
     select SF15_SEQ.nextval into :new.CAN_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF15_INS_TRG" ENABLE;
