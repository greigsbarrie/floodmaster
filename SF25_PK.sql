--------------------------------------------------------
--  DDL for Index SF25_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FLOODMASTER"."SF25_PK" ON "FLOODMASTER"."SF25_TYPE_ATTRIBUTE_MATRIX" ("DEFENCE_TYPE_ID", "ATTRIBUTE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I" ;
