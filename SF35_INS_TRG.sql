--------------------------------------------------------
--  DDL for Trigger SF35_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF35_INS_TRG" 
 BEFORE INSERT
 ON SF35_HISTORIC_FLOOD_OUTLINE
 FOR EACH ROW
begin
     select SF35_SEQ.nextval into :new.HFO_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF35_INS_TRG" ENABLE;
