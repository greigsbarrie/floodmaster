--------------------------------------------------------
--  DDL for Index FL96_FL85_FK_I
--------------------------------------------------------

  CREATE INDEX "FLOODMASTER"."FL96_FL85_FK_I" ON "FLOODMASTER"."FL96_LINKED_OBJECTIVES" ("LINK_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I" ;
