--------------------------------------------------------
--  DDL for Table FL999_FRM_LOG
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL999_FRM_LOG" 
   (	"LOG_ID" NUMBER, 
	"CREATED_DATE" DATE DEFAULT sysdate, 
	"CREATED_SOURCE" VARCHAR2(128 BYTE), 
	"LOG_LEVEL" NUMBER DEFAULT 9999, 
	"LOG_VALUE" VARCHAR2(4000 BYTE), 
	"LOG_USER" NUMBER, 
	"RUN_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
