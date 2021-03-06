--------------------------------------------------------
--  DDL for Table FL11_FLOOD_ICCS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL11_FLOOD_ICCS" 
   (	"SCU_ID" NUMBER, 
	"GE4_CONFLUENCE_ID" NUMBER(6,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
