--------------------------------------------------------
--  Constraints for Table FL13_SCU_ATTR_VALUES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL13_SCU_ATTR_VALUES" ADD CONSTRAINT "FL13_PK" PRIMARY KEY ("SCU_ID", "ATTRIBUTE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL13_SCU_ATTR_VALUES" MODIFY ("ATTRIBUTE_VALUE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL13_SCU_ATTR_VALUES" MODIFY ("ATTRIBUTE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL13_SCU_ATTR_VALUES" MODIFY ("SCU_ID" NOT NULL ENABLE);
