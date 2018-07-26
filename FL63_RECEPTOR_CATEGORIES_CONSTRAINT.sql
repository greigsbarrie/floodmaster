--------------------------------------------------------
--  Constraints for Table FL63_RECEPTOR_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL63_RECEPTOR_CATEGORIES" MODIFY ("RECEPTOR_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL63_RECEPTOR_CATEGORIES" MODIFY ("RECEPTOR_CATEGORY_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL63_RECEPTOR_CATEGORIES" ADD CONSTRAINT "FL63_PK" PRIMARY KEY ("RECEPTOR_CATEGORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
