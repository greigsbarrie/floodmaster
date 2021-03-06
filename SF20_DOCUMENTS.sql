--------------------------------------------------------
--  DDL for Table SF20_DOCUMENTS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."SF20_DOCUMENTS" 
   (	"DOC_ID" NUMBER, 
	"SCHEME_ID" NUMBER, 
	"DOT_ID" NUMBER, 
	"PHD_ID" NUMBER, 
	"DEFENCE_ID" NUMBER, 
	"SCS_ID" NUMBER, 
	"DOCUMENT_REFERENCE" VARCHAR2(10 BYTE), 
	"EASTING" NUMBER(6,0), 
	"NORTHING" NUMBER(6,0), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"DATE_TAKEN" DATE, 
	"COMMENTS" VARCHAR2(500 BYTE), 
	"FILE_NAME" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
