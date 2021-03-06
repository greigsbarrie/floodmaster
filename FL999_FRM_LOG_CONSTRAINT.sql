--------------------------------------------------------
--  Constraints for Table FL999_FRM_LOG
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL999_FRM_LOG" ADD CONSTRAINT "FL999_FRM_LOG_PK" PRIMARY KEY ("LOG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL999_FRM_LOG" MODIFY ("LOG_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL999_FRM_LOG" MODIFY ("CREATED_SOURCE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL999_FRM_LOG" MODIFY ("CREATED_DATE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL999_FRM_LOG" MODIFY ("LOG_ID" NOT NULL ENABLE);
