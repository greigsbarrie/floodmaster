--------------------------------------------------------
--  DDL for Trigger SF01_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF01_INS_TRG" 
 BEFORE INSERT
 ON SF01_FLOOD_PREVENTION_SCHEME
 FOR EACH ROW
begin
     select SF01_SEQ.nextval into :new.SCHEME_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF01_INS_TRG" ENABLE;
