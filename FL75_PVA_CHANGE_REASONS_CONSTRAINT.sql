--------------------------------------------------------
--  Constraints for Table FL75_PVA_CHANGE_REASONS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL75_PVA_CHANGE_REASONS" ADD CONSTRAINT "FL75_PK" PRIMARY KEY ("REASON_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL75_PVA_CHANGE_REASONS" MODIFY ("REASON" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL75_PVA_CHANGE_REASONS" MODIFY ("REASON_ID" NOT NULL ENABLE);