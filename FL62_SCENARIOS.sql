--------------------------------------------------------
--  DDL for Table FL62_SCENARIOS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL62_SCENARIOS" 
   (	"SCENARIO_ID" NUMBER, 
	"SCENARIO_DESCRIPTION" VARCHAR2(30 BYTE), 
	"RETURN_PERIOD" NUMBER, 
	"DEFENDED_YN" VARCHAR2(1 BYTE), 
	"CLIMATE_CHANGE_YN" VARCHAR2(1 BYTE), 
	"LOSS" VARCHAR2(30 BYTE), 
	"STORM_DURATION" NUMBER(3,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;