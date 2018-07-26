--------------------------------------------------------
--  DDL for View VW_AB_IMPDATA_CHK_SUMMARY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_AB_IMPDATA_CHK_SUMMARY" ("SOURCE_AB_TYPE_ID", "SCENARIO_DESCRIPTION", "VOL_SCU", "VOL_ROWS", "SCENARIO_EXISTS") AS 
  SELECT cd.source_ab_type_id
         ,cd.scenario_description
         ,Count (Distinct cd.scu_id) vol_scu
         ,Count (cd.scu_id) vol_rows
         ,cd.scenario_exists
   From vw_ab_impdata_scenario_chk cd
   Group By cd.scenario_description, cd.source_ab_type_id, scenario_exists
   Order By cd.source_ab_type_id, cd.scenario_description;
