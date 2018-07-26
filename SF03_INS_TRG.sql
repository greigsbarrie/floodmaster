--------------------------------------------------------
--  DDL for Trigger SF03_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF03_INS_TRG" 
 BEFORE INSERT
 ON SF03_FLOOD_EXTENT
 FOR EACH ROW
begin
     select SF03_SEQ.nextval into :new.EXTENT_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF03_INS_TRG" ENABLE;
