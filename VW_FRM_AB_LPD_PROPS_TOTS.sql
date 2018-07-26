--------------------------------------------------------
--  DDL for View VW_FRM_AB_LPD_PROPS_TOTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_LPD_PROPS_TOTS" ("LPD_ID", "LPD_NAME", "AB_RES_PROPS_TOT", "AB_NONRES_PROPS_TOT") AS 
  SELECT fl03.lpd_id
         , (Select fl02.lpd_name
            From fl02_local_plan_districts fl02
            Where fl02.lpd_id = fl03.lpd_id)
             lpd_name
         ,Sum (fl69.ab_res_props_tot) ab_res_props_tot
         ,Sum (fl69.ab_nonres_props_tot) ab_nonres_props_tot
   From fl03_frm_sub_catchment_units fl03, fl69_ab_props_counts fl69
   Where fl03.scu_id = fl69.scu_id
   Group By fl03.lpd_id, 2;
