--------------------------------------------------------
--  DDL for Index FL91_AN
--------------------------------------------------------

  CREATE INDEX "FLOODMASTER"."FL91_AN" ON "FLOODMASTER"."FL91_FRM_LPD_COLUMNS" ("ATTRIBUTE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
