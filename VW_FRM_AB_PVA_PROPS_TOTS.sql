--------------------------------------------------------
--  DDL for View VW_FRM_AB_PVA_PROPS_TOTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_PVA_PROPS_TOTS" ("PVA_ID", "PVA_REFERENCE", "AB_RES_PROPS_TOT", "AB_NONRES_PROPS_TOT") AS 
  SELECT fl03.pva_id
         , (Select fl01.pva_reference
            From fl01_pvas fl01
            Where fl01.pva_id = fl03.pva_id)
             pva_reference
         ,Sum (fl69.ab_res_props_tot) ab_res_props_tot
         ,Sum (fl69.ab_nonres_props_tot) ab_nonres_props_tot
   From fl03_frm_sub_catchment_units fl03, fl69_ab_props_counts fl69
   Where fl03.scu_id = fl69.scu_id
     And fl03.pva_id Is Not Null
   Group By fl03.pva_id, 2;
