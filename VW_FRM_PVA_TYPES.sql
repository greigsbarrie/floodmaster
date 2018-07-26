--------------------------------------------------------
--  DDL for View VW_FRM_PVA_TYPES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_PVA_TYPES" ("PVA_ID", "TYPE", "VALUE", "WISE_CODE") AS 
  SELECT fl20.pva_id,'Source' type,fl50.description value,fl50.source_code_wise wise_code from fl20_pva_sources fl20 join fl50_sources fl50
              on(FL20.SOURCE_CODE=fl50.source_code)
union all
select fl21.pva_id,'Cause' type,fl51.description value,fl51.cause_code_wise wise_code from fl21_pva_causes fl21 join fl51_causes fl51
              on(FL21.cause_CODE=fl51.cause_code)
union all
select fl22.pva_id,'Characteristic' type,fl52.description value,fl52.characteristic_code_wise wise_code from fl22_pva_characteristics fl22 join fl52_characteristics fl52
              on(FL22.characteristic_CODE=fl52.characteristic_code)
 ;
