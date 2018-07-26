--------------------------------------------------------
--  DDL for Trigger FL103_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL103_INS_TRG" 
 BEFORE INSERT
 ON FL103_ACTION_REFS
 FOR EACH ROW
begin
     select FL103_SEQ.nextval into :new.ACTION_ID from dual;
   end;
/
ALTER TRIGGER "FLOODMASTER"."FL103_INS_TRG" ENABLE;
