--------------------------------------------------------
--  DDL for Trigger SF05_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF05_INS_TRG" 
 BEFORE INSERT
 ON SF05_AREA_OF_BENEFIT
 FOR EACH ROW
begin
     select SF05_SEQ.nextval into :new.AOB_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF05_INS_TRG" ENABLE;
