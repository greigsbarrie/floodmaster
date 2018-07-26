--------------------------------------------------------
--  DDL for Trigger FL01_UDT_TR_STATUS_ID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL01_UDT_TR_STATUS_ID" 
 AFTER UPDATE OF STATUS_ID
 ON FL01_PVAS
 FOR EACH ROW
BEGIN
    IF :new.status_id <> :old.status_id THEN
        INSERT INTO FL78_PVA_STATUS_LOG (UPDATED_BY, UPDATE_DATE, STATUS_ID, PVA_ID)
        VALUES (user, sysdate, :new.status_id, :new.pva_id);
    END IF;
END;
/
ALTER TRIGGER "FLOODMASTER"."FL01_UDT_TR_STATUS_ID" ENABLE;
