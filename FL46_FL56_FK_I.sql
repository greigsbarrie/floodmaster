--------------------------------------------------------
--  DDL for Index FL46_FL56_FK_I
--------------------------------------------------------

  CREATE INDEX "FLOODMASTER"."FL46_FL56_FK_I" ON "FLOODMASTER"."FL46_FE_IMPACTS_ECON" ("IMPACT_CODE_ECON") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_I" ;
