--------------------------------------------------------
--  Constraints for Table FL82_OBJ_TYPE_TO_COVERAGE_TYPE
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL82_OBJ_TYPE_TO_COVERAGE_TYPE" ADD CONSTRAINT "FL82_PK" PRIMARY KEY ("COVERAGE_TYPE_ID", "OBJECTIVE_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL82_OBJ_TYPE_TO_COVERAGE_TYPE" MODIFY ("OBJECTIVE_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL82_OBJ_TYPE_TO_COVERAGE_TYPE" MODIFY ("COVERAGE_TYPE_ID" NOT NULL ENABLE);