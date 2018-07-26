--------------------------------------------------------
--  Constraints for Table SF27_DEFENCE_ATTRIBUTES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF27_DEFENCE_ATTRIBUTES" ADD CONSTRAINT "SF27_PK" PRIMARY KEY ("DEFENCE_ID", "ATTRIBUTE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF27_DEFENCE_ATTRIBUTES" MODIFY ("ATTRIBUTE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF27_DEFENCE_ATTRIBUTES" MODIFY ("DEFENCE_ID" NOT NULL ENABLE);
