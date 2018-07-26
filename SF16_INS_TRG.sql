--------------------------------------------------------
--  DDL for Trigger SF16_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF16_INS_TRG" 
 BEFORE INSERT
 ON SF16_SURVEYED_CROSS_SECTION
 FOR EACH ROW
begin
     select SF16_SEQ.nextval into :new.SCS_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF16_INS_TRG" ENABLE;
