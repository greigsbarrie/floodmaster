--------------------------------------------------------
--  DDL for Trigger SF06_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF06_INS_TRG" 
 BEFORE INSERT
 ON SF06_FINDING_AND_VARIATION
 FOR EACH ROW
begin
     select SF06_SEQ.nextval into :new.FAV_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF06_INS_TRG" ENABLE;
