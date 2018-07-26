--------------------------------------------------------
--  DDL for Trigger SF19_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF19_INS_TRG" 
 BEFORE INSERT
 ON SF19_FAULT
 FOR EACH ROW
begin
     select SF19_SEQ.nextval into :new.FAULT_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF19_INS_TRG" ENABLE;
