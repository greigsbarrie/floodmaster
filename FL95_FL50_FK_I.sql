--------------------------------------------------------
--  DDL for Index FL95_FL50_FK_I
--------------------------------------------------------

  CREATE INDEX "FLOODMASTER"."FL95_FL50_FK_I" ON "FLOODMASTER"."FL95_OBJECTIVE_SOURCES" ("SOURCE_CODE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I" ;
