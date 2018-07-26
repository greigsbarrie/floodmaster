--------------------------------------------------------
--  DDL for Table FL66_SINGLE_SITE_TYPES
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL66_SINGLE_SITE_TYPES" 
   (	"SINGLE_SITE_TYPE_ID" NUMBER, 
	"SINGLE_SITE_TYPE" VARCHAR2(240 BYTE), 
	"SINGLE_SITE_TYPE_DISPLAY_NAME" VARCHAR2(240 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
