--------------------------------------------------------
--  Constraints for Table SF16_SURVEYED_CROSS_SECTION
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF16_SURVEYED_CROSS_SECTION" ADD CONSTRAINT "SF16_PK" PRIMARY KEY ("SCS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF16_SURVEYED_CROSS_SECTION" MODIFY ("SCHEME_ID" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF16_SURVEYED_CROSS_SECTION" MODIFY ("SCS_ID" NOT NULL ENABLE);
