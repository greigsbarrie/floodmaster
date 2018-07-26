--------------------------------------------------------
--  DDL for View VW_FRM_AB_SCU_PROPS_TOTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_SCU_PROPS_TOTS" ("SCU_ID", "SCU_REFERENCE", "AB_RES_PROPS_TOT", "AB_NONRES_PROPS_TOT") AS 
  SELECT fl69.scu_id
         ,fl03.scu_reference scu_reference
         ,fl69.ab_res_props_tot
         ,fl69.ab_nonres_props_tot
   From fl03_frm_sub_catchment_units fl03, fl69_ab_props_counts fl69
   Where fl03.scu_id = fl69.scu_id;
