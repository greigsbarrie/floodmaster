--------------------------------------------------------
--  DDL for Trigger SF26_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF26_INS_TRG" 
 BEFORE INSERT
 ON SF26_FLOOD_DEFENCE
 FOR EACH ROW
begin
     select SF26_SEQ.nextval into :new.DEFENCE_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF26_INS_TRG" ENABLE;
