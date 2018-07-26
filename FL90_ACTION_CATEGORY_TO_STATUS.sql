--------------------------------------------------------
--  DDL for Table FL90_ACTION_CATEGORY_TO_STATUS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL90_ACTION_CATEGORY_TO_STATUS" 
   (	"ACTION_CATEGORY_ID" NUMBER, 
	"ACTION_STATUS_ID" NUMBER, 
	"WISE_CODE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;