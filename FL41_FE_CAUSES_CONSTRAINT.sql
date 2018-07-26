--------------------------------------------------------
--  Constraints for Table FL41_FE_CAUSES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL41_FE_CAUSES" MODIFY ("CAUSE_CODE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL41_FE_CAUSES" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL41_FE_CAUSES" ADD CONSTRAINT "FL41_PK" PRIMARY KEY ("EVENT_ID", "CAUSE_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
