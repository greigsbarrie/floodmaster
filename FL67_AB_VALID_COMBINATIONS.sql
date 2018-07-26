--------------------------------------------------------
--  DDL for Table FL67_AB_VALID_COMBINATIONS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL67_AB_VALID_COMBINATIONS" 
   (	"ID" NUMBER(10,0), 
	"LOAD_TABLE_COLUMN_NAME" VARCHAR2(40 BYTE), 
	"SOURCE_AB_TYPE_ID" NUMBER, 
	"RECEPTOR_ID" NUMBER, 
	"FR_IND_ID" NUMBER, 
	"SINGLE_SITE_TYPE_ID" NUMBER, 
	"WISE_CODE_CONSEQUENCE" VARCHAR2(4000 BYTE), 
	"WISE_CATEGORY_CONSEQUENCE" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
