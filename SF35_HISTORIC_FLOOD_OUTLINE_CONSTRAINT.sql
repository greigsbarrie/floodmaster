--------------------------------------------------------
--  Constraints for Table SF35_HISTORIC_FLOOD_OUTLINE
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF35_HISTORIC_FLOOD_OUTLINE" ADD CONSTRAINT "SF35_PK" PRIMARY KEY ("HFO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF35_HISTORIC_FLOOD_OUTLINE" MODIFY ("PRB_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF35_HISTORIC_FLOOD_OUTLINE" MODIFY ("SCHEME_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF35_HISTORIC_FLOOD_OUTLINE" MODIFY ("HFO_ID" NOT NULL ENABLE);
