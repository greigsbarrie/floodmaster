--------------------------------------------------------
--  DDL for Trigger SF11_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF11_INS_TRG" 
 BEFORE INSERT
 ON SF11_HYDROLOGY
 FOR EACH ROW
begin
     select SF11_SEQ.nextval into :new.HYD_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF11_INS_TRG" ENABLE;
