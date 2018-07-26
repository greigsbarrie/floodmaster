--------------------------------------------------------
--  DDL for View VW_AB_IMPDATA_CHK_SCU
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_AB_IMPDATA_CHK_SCU" ("SOURCE_AB_TYPE_ID", "SCENARIO_DESCRIPTION", "SCU_ID", "VOL_ROWS", "SCENARIO_EXISTS") AS 
  SELECT cd.source_ab_type_id
         ,cd.scenario_description
         ,cd.scu_id
         ,Count (cd.scu_id) vol_rows
         ,cd.scenario_exists
   From vw_ab_impdata_scenario_chk cd
   Where cd.scu_id Is Not Null
   Group By cd.source_ab_type_id
           ,cd.scenario_description
           ,cd.scu_id
           ,cd.scenario_exists;
