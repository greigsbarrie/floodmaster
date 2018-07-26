--------------------------------------------------------
--  DDL for Table FL71_AB_SINGLE_SITE_COUNTS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL71_AB_SINGLE_SITE_COUNTS" 
   (	"ID" NUMBER(10,0), 
	"FL71_COUNT" NUMBER, 
	"DATE_DERIVED" DATE, 
	"SOURCE_AB_TYPE_ID" NUMBER, 
	"SINGLE_SITE_TYPE_ID" NUMBER, 
	"SCENARIO_ID" NUMBER, 
	"RECEPTOR_ID" NUMBER, 
	"SCU_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;