--------------------------------------------------------
--  DDL for Table SF05_AREA_OF_BENEFIT
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."SF05_AREA_OF_BENEFIT" 
   (	"AOB_ID" NUMBER, 
	"SCHEME_ID" NUMBER, 
	"PRB_ID" NUMBER, 
	"AOB_REFERENCE" NUMBER, 
	"SOP" VARCHAR2(20 BYTE), 
	"AOB_AREA" NUMBER(10,5), 
	"COMMENTS" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
