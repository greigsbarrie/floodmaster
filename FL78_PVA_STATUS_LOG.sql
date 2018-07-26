--------------------------------------------------------
--  DDL for Table FL78_PVA_STATUS_LOG
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL78_PVA_STATUS_LOG" 
   (	"PVA_ID" NUMBER, 
	"STATUS_ID" NUMBER, 
	"UPDATED_BY" VARCHAR2(4000 BYTE), 
	"UPDATE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;