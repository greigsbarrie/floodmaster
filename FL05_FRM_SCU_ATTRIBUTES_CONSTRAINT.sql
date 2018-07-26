--------------------------------------------------------
--  Constraints for Table FL05_FRM_SCU_ATTRIBUTES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" ADD CONSTRAINT "FL05_PK" PRIMARY KEY ("ATTRIBUTE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" ADD CONSTRAINT "FL05_CHK_PUBYN" CHECK (PUBLISH_YN IN('Y','N')) ENABLE;
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" ADD CONSTRAINT "FL05_FL05_2_UK" UNIQUE ("ATTRIBUTE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" MODIFY ("DISPLAY_SEQUENCE" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" MODIFY ("PUBLISH_YN" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" MODIFY ("FORMAT" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" MODIFY ("DISPLAY_NAME" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" MODIFY ("ATTRIBUTE_NAME" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" MODIFY ("ATTRIBUTE_ID" NOT NULL ENABLE);