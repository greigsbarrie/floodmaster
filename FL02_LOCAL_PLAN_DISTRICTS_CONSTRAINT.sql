--------------------------------------------------------
--  Constraints for Table FL02_LOCAL_PLAN_DISTRICTS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" ADD CONSTRAINT "FL02_PK" PRIMARY KEY ("LPD_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" MODIFY ("RBD_CODE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" MODIFY ("GEOGRAPHIC_EXTENT" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" MODIFY ("DATE_DERIVED" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" MODIFY ("LPD_NAME" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" MODIFY ("LPD_ID" NOT NULL ENABLE);
