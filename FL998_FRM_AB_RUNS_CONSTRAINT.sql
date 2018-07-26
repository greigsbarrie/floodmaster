--------------------------------------------------------
--  Constraints for Table FL998_FRM_AB_RUNS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL998_FRM_AB_RUNS" ADD CONSTRAINT "FL998_FRM_AB_RUNS_PK" PRIMARY KEY ("RUN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL998_FRM_AB_RUNS" MODIFY ("RUN_STATUS" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL998_FRM_AB_RUNS" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL998_FRM_AB_RUNS" MODIFY ("RUN_ID" NOT NULL ENABLE);
