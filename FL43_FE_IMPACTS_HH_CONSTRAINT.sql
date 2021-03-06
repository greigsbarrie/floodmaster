--------------------------------------------------------
--  Constraints for Table FL43_FE_IMPACTS_HH
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL43_FE_IMPACTS_HH" MODIFY ("IMPACT_CODE_HH" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL43_FE_IMPACTS_HH" MODIFY ("EVENT_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL43_FE_IMPACTS_HH" ADD CONSTRAINT "FL43_PK" PRIMARY KEY ("EVENT_ID", "IMPACT_CODE_HH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
