--------------------------------------------------------
--  DDL for Table SF28_DEFENCE_ATTRIBUTE_LOOKUP
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."SF28_DEFENCE_ATTRIBUTE_LOOKUP" 
   (	"DAL_ID" NUMBER, 
	"ATTRIBUTE_ID" NUMBER, 
	"ABBREVIATION" VARCHAR2(10 BYTE), 
	"ATTRIBUTE_VALUE" VARCHAR2(250 BYTE), 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"SEQUENCE" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
