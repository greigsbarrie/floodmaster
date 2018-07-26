--------------------------------------------------------
--  Constraints for Table SF31_INSPECTION_FREQUENCY
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF31_INSPECTION_FREQUENCY" ADD CONSTRAINT "SF31_PK" PRIMARY KEY ("INF_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF31_INSPECTION_FREQUENCY" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF31_INSPECTION_FREQUENCY" MODIFY ("INF_ID" NOT NULL ENABLE);