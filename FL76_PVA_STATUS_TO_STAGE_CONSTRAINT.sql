--------------------------------------------------------
--  Constraints for Table FL76_PVA_STATUS_TO_STAGE
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL76_PVA_STATUS_TO_STAGE" ADD CONSTRAINT "FL76_PK" PRIMARY KEY ("STATUS_ID", "STAGE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL76_PVA_STATUS_TO_STAGE" MODIFY ("STAGE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL76_PVA_STATUS_TO_STAGE" MODIFY ("STATUS_ID" NOT NULL ENABLE);