--------------------------------------------------------
--  DDL for Trigger SF20_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."SF20_INS_TRG" 
 BEFORE INSERT
 ON SF20_DOCUMENTS
 FOR EACH ROW
begin
     select SF20_SEQ.nextval into :new.DOC_ID from dual;
   end;

/
ALTER TRIGGER "FLOODMASTER"."SF20_INS_TRG" ENABLE;
