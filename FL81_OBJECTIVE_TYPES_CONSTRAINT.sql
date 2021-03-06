--------------------------------------------------------
--  Constraints for Table FL81_OBJECTIVE_TYPES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL81_OBJECTIVE_TYPES" ADD CONSTRAINT "FL81_PK" PRIMARY KEY ("OBJECTIVE_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL81_OBJECTIVE_TYPES" MODIFY ("OBJECTIVE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL81_OBJECTIVE_TYPES" MODIFY ("OBJECTIVE_TYPE_ID" NOT NULL ENABLE);
