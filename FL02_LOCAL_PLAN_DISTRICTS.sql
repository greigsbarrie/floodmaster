--------------------------------------------------------
--  DDL for Table FL02_LOCAL_PLAN_DISTRICTS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL02_LOCAL_PLAN_DISTRICTS" 
   (	"LPD_ID" NUMBER, 
	"LPD_NAME" VARCHAR2(240 BYTE), 
	"LEAD_LA_ID" NUMBER(*,0), 
	"DATE_DERIVED" DATE, 
	"GEOGRAPHIC_EXTENT" VARCHAR2(240 BYTE), 
	"RBD_CODE" VARCHAR2(7 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
