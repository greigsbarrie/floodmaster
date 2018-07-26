--------------------------------------------------------
--  DDL for View VW_PVA_TYPES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_PVA_TYPES" ("PVA_ID", "TYPE", "VALUE") AS 
  SELECT PVA_ID,'Source' Type,SOURCE_CODE value FROM FL20_PVA_SOURCES
union all
SELECT PVA_ID,'Cause' type,cause_code value from fl21_pva_causes
union all
select pva_id,'Characteristics',CHARACTERISTIC_CODE from FL22_PVA_CHARACTERISTICS
 ;
