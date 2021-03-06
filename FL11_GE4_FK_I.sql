--------------------------------------------------------
--  DDL for Index FL11_GE4_FK_I
--------------------------------------------------------

  CREATE INDEX "FLOODMASTER"."FL11_GE4_FK_I" ON "FLOODMASTER"."FL11_FLOOD_ICCS" ("GE4_CONFLUENCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I" ;
