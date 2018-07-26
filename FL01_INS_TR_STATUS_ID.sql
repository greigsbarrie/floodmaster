--------------------------------------------------------
--  DDL for Trigger FL01_INS_TR_STATUS_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL01_INS_TR_STATUS_ID" 
 AFTER INSERT
 ON FL01_PVAS
 FOR EACH ROW
BEGIN
        INSERT INTO FL78_PVA_STATUS_LOG (UPDATED_BY, UPDATE_DATE, STATUS_ID, PVA_ID)
        VALUES (user, sysdate, :new.status_id, :new.pva_id);
END;
/
ALTER TRIGGER "FLOODMASTER"."FL01_INS_TR_STATUS_ID" ENABLE;
