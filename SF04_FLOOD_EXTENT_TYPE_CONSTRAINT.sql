--------------------------------------------------------
--  Constraints for Table SF04_FLOOD_EXTENT_TYPE
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF04_FLOOD_EXTENT_TYPE" ADD CONSTRAINT "SF04_PK" PRIMARY KEY ("EXTENT_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF04_FLOOD_EXTENT_TYPE" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF04_FLOOD_EXTENT_TYPE" MODIFY ("EXTENT_TYPE_ID" NOT NULL ENABLE);