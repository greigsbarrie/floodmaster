--------------------------------------------------------
--  DDL for View VW_FRM_AB_CATCHMENT_PROPS_TOTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_CATCHMENT_PROPS_TOTS" ("CATCHMENT_ID", "CATCHMENT", "AB_RES_PROPS_TOT", "AB_NONRES_PROPS_TOT") AS 
  With catchments As (Select ge2.ge2_catchname, ge2.ge2_catchnum, fl11.scu_id
                       From ge4_baseline_confluences ge4, ge2_catchment ge2, fl11_flood_iccs fl11
                       Where ge4.ge4_catchment_id = ge2.ge2_catchnum
                         And fl11.scu_id = ge4.ge4_confluence_id)
   Select cat.ge2_catchnum
         ,cat.ge2_catchname
         ,Sum (fl69.ab_res_props_tot) ab_res_props_tot
         ,Sum (fl69.ab_nonres_props_tot) ab_nonres_props_tot
   From catchments cat, fl69_ab_props_counts fl69
   Where cat.scu_id(+) = fl69.scu_id
   Group By cat.ge2_catchname, cat.ge2_catchnum;
