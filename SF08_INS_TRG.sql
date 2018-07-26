--------------------------------------------------------
--  DDL for Trigger SF08_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF08_INS_TRG" 
 BEFORE INSERT
 ON SF08_COASTAL_HYDRAULICS
 FOR EACH ROW
begin
     select SF08_SEQ.nextval into :new.COH_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF08_INS_TRG" ENABLE;
