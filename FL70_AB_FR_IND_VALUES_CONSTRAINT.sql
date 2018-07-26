--------------------------------------------------------
--  Constraints for Table FL70_AB_FR_IND_VALUES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" ADD CONSTRAINT "FL70_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("SCU_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("FR_IND_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("SCENARIO_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("SOURCE_AB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("RECEPTOR_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("DATE_DERIVED" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("VALUE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL70_AB_FR_IND_VALUES" MODIFY ("ID" NOT NULL ENABLE);