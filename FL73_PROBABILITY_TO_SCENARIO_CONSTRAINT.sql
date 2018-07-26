--------------------------------------------------------
--  Constraints for Table FL73_PROBABILITY_TO_SCENARIO
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL73_PROBABILITY_TO_SCENARIO" MODIFY ("SCENARIO_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL73_PROBABILITY_TO_SCENARIO" MODIFY ("SOURCE_AB_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL73_PROBABILITY_TO_SCENARIO" ADD CONSTRAINT "AVCON_1394186629_PROBA_000" CHECK (PROBABILITY IN ('L', 'M', 'H')) ENABLE;
  ALTER TABLE "FLOODMASTER"."FL73_PROBABILITY_TO_SCENARIO" ADD CONSTRAINT "FL73_PK" PRIMARY KEY ("SCENARIO_ID", "SOURCE_AB_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;