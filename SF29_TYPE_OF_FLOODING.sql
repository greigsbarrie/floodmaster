--------------------------------------------------------
--  DDL for Table SF29_TYPE_OF_FLOODING
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."SF29_TYPE_OF_FLOODING" 
   (	"TOF_ID" NUMBER, 
	"DESCRIPTION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;