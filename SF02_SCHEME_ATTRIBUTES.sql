--------------------------------------------------------
--  DDL for Table SF02_SCHEME_ATTRIBUTES
--------------------------------------------------------

  CREATE TABLE "FLOODMASTER"."SF02_SCHEME_ATTRIBUTES" 
   (	"SCHEME_ID" NUMBER, 
	"SCHEME_COMPLETED" VARCHAR2(1 BYTE), 
	"COMMENTS" VARCHAR2(1000 BYTE), 
	"SE_FILE_REF" VARCHAR2(250 BYTE), 
	"CATEGORY" VARCHAR2(1 BYTE), 
	"TOWN_CITY" VARCHAR2(100 BYTE), 
	"WATERCOURSE" VARCHAR2(50 BYTE), 
	"LENGTH_KM" NUMBER(13,5), 
	"DATE_FPO" VARCHAR2(20 BYTE), 
	"DATE_CONSTRUCTION" VARCHAR2(50 BYTE), 
	"MAINTENANCE_REGIME" VARCHAR2(50 BYTE), 
	"CONSTRUCTION_COST" NUMBER(12,2), 
	"CONSTRUCTION_COST_AT_2004" NUMBER(12,2), 
	"COST_BENEFIT_RATIO" NUMBER(12,3), 
	"CURRENT_COST_BENEFIT_RATIO" NUMBER(12,3), 
	"DRAWINGS" VARCHAR2(500 BYTE), 
	"LIST_OF_PERTINENT_DOCUMENTS" VARCHAR2(500 BYTE), 
	"DESIGN_FLOOD_MAP" VARCHAR2(1 BYTE), 
	"DESIGN_MODEL" VARCHAR2(1 BYTE), 
	"DESIGN_AS_BUILTS" VARCHAR2(2 BYTE), 
	"DESIGN_CATCHMENT_AREA" NUMBER(4,0), 
	"VOLUME_OF_DESIGN" NUMBER(8,0), 
	"DESIGN_FLOW" NUMBER(8,3), 
	"DESIGN_100_YR_FLOW" NUMBER(8,3), 
	"DESIGN_SOP" VARCHAR2(10 BYTE), 
	"CURRENT_SOP" VARCHAR2(10 BYTE), 
	"SOP_AS_BUILTS" NUMBER(4,0), 
	"SOP_WITH_FAULTS" NUMBER(4,0), 
	"CC_ADDED_TO_FLOW" NUMBER(2,0), 
	"AUTO_FEH_Q100" NUMBER(6,2), 
	"AUTO_FEH_COMMENTS" VARCHAR2(250 BYTE), 
	"DEFENDED_AREA" VARCHAR2(1 BYTE), 
	"ANNUAL_AVG_DAMAGE_DEFENDED" NUMBER(10,0), 
	"ANNUAL_AVG_DAMAGE_UNDEFENDED" NUMBER(10,0), 
	"NUM_PROPERTIES_AT_RISK_100" NUMBER(4,0), 
	"NUM_PROPERTIES_AT_RISK_200" NUMBER(4,0), 
	"NUM_COMM_PROPERTIES_DEFENDED" NUMBER(4,0), 
	"NUM_RES_PROPERTIES_DEFENDED" NUMBER(4,0), 
	"PRESENT_VAL_DAMAGE_DEFENDED" NUMBER(10,0), 
	"PRESENT_VAL_DAMAGE_UNDEFENDED" NUMBER(10,0), 
	"PRESENT_VAL_DAMAGE_AVOIDED" NUMBER(10,0), 
	"ONSET_RP" NUMBER(4,0), 
	"SE_1961_SCHEME_LIST" NUMBER(2,0), 
	"NUM_PROPERTIES_DEFENDED_SOP" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "FLOOD_D" ;
