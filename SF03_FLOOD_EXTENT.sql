--------------------------------------------------------
--  DDL for Table SF03_FLOOD_EXTENT
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."SF03_FLOOD_EXTENT" 
   (	"EXTENT_ID" NUMBER, 
	"SCHEME_ID" NUMBER, 
	"EXTENT_TYPE_ID" NUMBER, 
	"PRB_ID" NUMBER, 
	"EXTENT_REFERENCE" NUMBER, 
	"DATE_TAKEN" NUMBER, 
	"DESIGN_LEVEL_OF_PROTECTION" NUMBER, 
	"EXTENT_AREA" NUMBER(12,4)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
