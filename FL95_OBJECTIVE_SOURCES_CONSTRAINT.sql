--------------------------------------------------------
--  Constraints for Table FL95_OBJECTIVE_SOURCES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL95_OBJECTIVE_SOURCES" ADD CONSTRAINT "FL95_PK" PRIMARY KEY ("OBJECTIVE_ID", "SOURCE_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL95_OBJECTIVE_SOURCES" MODIFY ("SOURCE_CODE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL95_OBJECTIVE_SOURCES" MODIFY ("OBJECTIVE_ID" NOT NULL ENABLE);
