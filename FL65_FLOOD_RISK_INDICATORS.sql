--------------------------------------------------------
--  DDL for Table FL65_FLOOD_RISK_INDICATORS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL65_FLOOD_RISK_INDICATORS" 
   (	"FR_IND_ID" NUMBER, 
	"FR_IND" VARCHAR2(40 BYTE), 
	"FR_IND_DISPLAY_NAME" VARCHAR2(40 BYTE), 
	"FR_IND_AGG_TYPE" VARCHAR2(40 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;