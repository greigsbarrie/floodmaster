--------------------------------------------------------
--  DDL for View VW_FRM_AB_LPD_VALUES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_LPD_VALUES" ("LPD_ID", "LPD_NAME", "SOURCE_AB_TYPE_ID", "SOURCE_CODE", "DESCRIPTION", "AB_TYPE_ID", "AB_TYPE", "SCENARIO_ID", "SCENARIO_DESCRIPTION", "RECEPTOR_ID", "RECEPTOR", "FR_IND_ID", "FR_IND_DISPLAY_NAME", "AGG_VALUE", "SINGLE_SITE_TYPE_ID", "SINGLE_SITE_TYPE", "SINGLE_SITE_TYPE_DISPLAY_NAME", "SINGLE_SITE_COUNT") AS 
  With comb_vals As (Select fl70.source_ab_type_id
                            ,fl70.scenario_id
                            ,fl70.receptor_id
                            ,fl70.scu_id
                            ,fl70.fr_ind_id
                            ,fl70.Value
                            ,To_number (Null) single_site_type_id
                            ,To_number (Null) fl71_count
                      From fl70_ab_fr_ind_values fl70
                      Union
                      Select fl71.source_ab_type_id
                            ,fl71.scenario_id
                            ,fl71.receptor_id
                            ,fl71.scu_id
                            ,To_number (Null) fr_ind_id
                            ,To_number (Null) Value
                            ,fl71.single_site_type_id
                            ,fl71.fl71_count
                      From fl71_ab_single_site_counts fl71),
       main_data As (Select cval.receptor_id
                           ,cval.scenario_id
                           ,cval.scu_id
                           ,cval.source_ab_type_id
                           ,cval.fr_ind_id
                           ,cval.Value
                           ,cval.single_site_type_id
                           ,cval.fl71_count single_site_count
                     From comb_vals cval),
       ref_data As (Select fl03.lpd_id
                          , (Select fl02.lpd_name
                             From fl02_local_plan_districts fl02
                             Where fl02.lpd_id = fl03.lpd_id)
                              lpd_name
                          ,md.source_ab_type_id
                          ,fl61.source_code
                          , (Select fl50.description
                             From fl50_sources fl50
                             Where fl50.source_code = fl61.source_code)
                              description
                          ,fl61.ab_type_id
                          , (Select fl60.ab_type
                             From fl60_ab_types fl60
                             Where fl60.ab_type_id = fl61.ab_type_id)
                              ab_type
                          ,md.scenario_id
                          , (Select fl62.scenario_description
                             From fl62_scenarios fl62
                             Where fl62.scenario_id = md.scenario_id)
                              scenario_description
                          ,md.receptor_id
                          , (Select fl64.receptor
                             From fl64_receptors fl64
                             Where fl64.receptor_id = md.receptor_id)
                              receptor
                          ,md.fr_ind_id
                          ,fl65.fr_ind
                          ,fl65.fr_ind_display_name
                          ,fl65.fr_ind_agg_type
                          ,md.Value
                          ,md.single_site_type_id
                          ,fl66.single_site_type
                          ,fl66.single_site_type_display_name
                          ,md.single_site_count
                    From main_data md
                        ,fl03_frm_sub_catchment_units fl03
                        ,fl61_source_ab_types fl61
                        ,fl65_flood_risk_indicators fl65
                        ,fl66_single_site_types fl66
                    Where fl03.scu_id = md.scu_id
                      And fl61.source_ab_type_id = md.source_ab_type_id
                      And fl65.fr_ind_id(+) = md.fr_ind_id
                      And fl66.single_site_type_id(+) = md.single_site_type_id)
   Select rd.lpd_id
         ,rd.lpd_name
         ,rd.source_ab_type_id
         ,rd.source_code
         ,rd.description
         ,rd.ab_type_id
         ,rd.ab_type
         ,rd.scenario_id
         ,rd.scenario_description
         ,rd.receptor_id
         ,rd.receptor
         ,rd.fr_ind_id
         ,rd.fr_ind_display_name
         ,Sum (rd.Value) agg_value
         ,rd.single_site_type_id
         ,rd.single_site_type
         ,rd.single_site_type_display_name
         ,Sum (single_site_count) single_site_count
   From ref_data rd
   Where (rd.fr_ind_agg_type = 'SUM'
       Or rd.single_site_type_id Is Not Null)
   Group By rd.lpd_id
           ,rd.lpd_name
           ,rd.source_ab_type_id
           ,rd.source_code
           ,rd.description
           ,rd.ab_type_id
           ,rd.ab_type
           ,rd.scenario_id
           ,rd.scenario_description
           ,rd.receptor_id
           ,rd.receptor
           ,rd.fr_ind_id
           ,rd.fr_ind_display_name
           ,rd.single_site_type_id
           ,rd.single_site_type
           ,rd.single_site_type_display_name
   Union
   Select rd.lpd_id
         ,rd.lpd_name
         ,rd.source_ab_type_id
         ,rd.source_code
         ,rd.description
         ,rd.ab_type_id
         ,rd.ab_type
         ,rd.scenario_id
         ,rd.scenario_description
         ,rd.receptor_id
         ,rd.receptor
         ,rd.fr_ind_id
         ,rd.fr_ind_display_name
         ,Avg (rd.Value) agg_value
         ,rd.single_site_type_id
         ,rd.single_site_type
         ,rd.single_site_type_display_name
         ,Sum (single_site_count) single_site_count
   From ref_data rd
   Where rd.single_site_type_id Is Null
     And rd.fr_ind_agg_type = 'AVE'
   Group By rd.lpd_id
           ,rd.lpd_name
           ,rd.source_ab_type_id
           ,rd.source_code
           ,rd.description
           ,rd.ab_type_id
           ,rd.ab_type
           ,rd.scenario_id
           ,rd.scenario_description
           ,rd.receptor_id
           ,rd.receptor
           ,rd.fr_ind_id
           ,rd.fr_ind_display_name
           ,rd.single_site_type_id
           ,rd.single_site_type
           ,rd.single_site_type_display_name;
