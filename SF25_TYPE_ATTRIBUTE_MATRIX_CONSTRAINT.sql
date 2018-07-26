--------------------------------------------------------
--  Constraints for Table SF25_TYPE_ATTRIBUTE_MATRIX
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF25_TYPE_ATTRIBUTE_MATRIX" ADD CONSTRAINT "AVCON_1470046799_MANDA_000" CHECK (MANDATORY IN ('Y', 'N')) ENABLE;
  ALTER TABLE "FLOODMASTER"."SF25_TYPE_ATTRIBUTE_MATRIX" ADD CONSTRAINT "SF25_PK" PRIMARY KEY ("DEFENCE_TYPE_ID", "ATTRIBUTE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF25_TYPE_ATTRIBUTE_MATRIX" MODIFY ("MANDATORY" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF25_TYPE_ATTRIBUTE_MATRIX" MODIFY ("ATTRIBUTE_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF25_TYPE_ATTRIBUTE_MATRIX" MODIFY ("DEFENCE_TYPE_ID" NOT NULL ENABLE);
