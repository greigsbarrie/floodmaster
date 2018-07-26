--------------------------------------------------------
--  Constraints for Table SF14_HYDROLOGY_INDEX
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF14_HYDROLOGY_INDEX" ADD CONSTRAINT "SF14_PK" PRIMARY KEY ("HYI_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I"  ENABLE;
  ALTER TABLE "FLOODMASTER"."SF14_HYDROLOGY_INDEX" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "FLOODMASTER"."SF14_HYDROLOGY_INDEX" MODIFY ("HYI_ID" NOT NULL ENABLE);
