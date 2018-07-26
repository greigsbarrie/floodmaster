--------------------------------------------------------
--  Constraints for Table FL52_CHARACTERISTICS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL52_CHARACTERISTICS" ADD CONSTRAINT "FL52_PK" PRIMARY KEY ("CHARACTERISTIC_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL52_CHARACTERISTICS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL52_CHARACTERISTICS" MODIFY ("CHARACTERISTIC_CODE_WISE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL52_CHARACTERISTICS" MODIFY ("CHARACTERISTIC_CODE" NOT NULL ENABLE);
