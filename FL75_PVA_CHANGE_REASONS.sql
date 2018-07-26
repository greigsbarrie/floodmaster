--------------------------------------------------------
--  DDL for Table FL75_PVA_CHANGE_REASONS
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."FL75_PVA_CHANGE_REASONS" 
   (	"REASON_ID" NUMBER, 
	"REASON" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
