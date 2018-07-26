--------------------------------------------------------
--  DDL for Trigger SF17_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF17_INS_TRG" 
 BEFORE INSERT
 ON SF17_DESIGN_CONSULTANT_USED
 FOR EACH ROW
begin
     select SF17_SEQ.nextval into :new.DCU_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF17_INS_TRG" ENABLE;
