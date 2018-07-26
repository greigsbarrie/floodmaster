--------------------------------------------------------
--  DDL for View VW_FRM_AB_PVA_VALUES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_PVA_VALUES" ("RBD_CODE", "PVA_ID", "PVA_REFERENCE", "SOURCE_AB_TYPE_ID", "SOURCE_CODE", "DESCRIPTION", "SOURCE_CODE_WISE", "AB_TYPE_ID", "AB_TYPE", "SCENARIO_ID", "SCENARIO_DESCRIPTION", "PROBABILITY", "RECEPTOR_ID", "RECEPTOR", "FR_IND_ID", "FR_IND", "FR_IND_DISPLAY_NAME", "WISE_CATEGORY_CONSEQUENCE", "WISE_CODE_CONSEQUENCE", "VALUE", "SINGLE_SITE_TYPE_ID", "SINGLE_SITE_TYPE", "SINGLE_SITE_TYPE_DISPLAY_NAME", "COUNT") AS 
  WITH ref_data
          AS (SELECT   fl02.rbd_code,
                       fl03.pva_id,
                       (SELECT   fl01.pva_reference
                          FROM   fl01_pvas fl01
                         WHERE   fl01.pva_id = fl03.pva_id)
                          pva_reference,
                       md.source_ab_type_id,
                       fl61.source_code,
                       (SELECT   fl50.description
                          FROM   fl50_sources fl50
                         WHERE   fl50.source_code = fl61.source_code)
                          description,
                       (SELECT   fl50.source_code_wise
                          FROM   fl50_sources fl50
                         WHERE   fl50.source_code = fl61.source_code)
                          source_code_wise,
                       fl61.ab_type_id,
                       (SELECT   fl60.ab_type
                          FROM   fl60_ab_types fl60
                         WHERE   fl60.ab_type_id = fl61.ab_type_id)
                          ab_type,
                       md.scenario_id,
                       (SELECT   fl62.scenario_description
                          FROM   fl62_scenarios fl62
                         WHERE   fl62.scenario_id = md.scenario_id)
                          scenario_description,
                       (SELECT   fl73.probability
                          FROM   fl73_probability_to_scenario fl73
                         WHERE   fl73.scenario_id = md.scenario_id
                                 AND fl73.source_ab_type_id =
                                       md.source_ab_type_id)
                          probability,
                       md.receptor_id,
                       (SELECT   fl64.receptor
                          FROM   fl64_receptors fl64
                         WHERE   fl64.receptor_id = md.receptor_id)
                          receptor,
                       md.fr_ind_id,
                       fl65.fr_ind,
                       fl65.fr_ind_display_name,
                       fl67.wise_category_consequence,
                       fl67.wise_code_consequence,
                       fl65.fr_ind_agg_type,
                       md.VALUE,
                       md.single_site_type_id,
                       fl66.single_site_type,
                       fl66.single_site_type_display_name,
                       md.single_site_count
                FROM   fl03_frm_sub_catchment_units fl03,
                       fl02_local_plan_districts fl02,
                       fl61_source_ab_types fl61,
                       fl65_flood_risk_indicators fl65,
                       fl66_single_site_types fl66,
                       fl67_ab_valid_combinations fl67,
                       (SELECT   cval.receptor_id,
                                 cval.scenario_id,
                                 cval.scu_id,
                                 cval.source_ab_type_id,
                                 cval.fr_ind_id,
                                 cval.VALUE,
                                 cval.single_site_type_id,
                                 cval.fl71_count single_site_count
                          FROM   (SELECT   fl70.source_ab_type_id,
                                           fl70.scenario_id,
                                           fl70.receptor_id,
                                           fl70.scu_id,
                                           fl70.fr_ind_id,
                                           fl70.VALUE,
                                           TO_NUMBER (NULL)
                                              single_site_type_id,
                                           TO_NUMBER (NULL) fl71_count
                                    FROM   fl70_ab_fr_ind_values fl70
                                  UNION
                                  SELECT   fl71.source_ab_type_id,
                                           fl71.scenario_id,
                                           fl71.receptor_id,
                                           fl71.scu_id,
                                           TO_NUMBER (NULL) fr_ind_id,
                                           TO_NUMBER (NULL) VALUE,
                                           fl71.single_site_type_id,
                                           fl71.fl71_count
                                    FROM   fl71_ab_single_site_counts fl71)
                                 cval) md
               WHERE       fl03.scu_id = md.scu_id
                       AND fl03.lpd_id = fl02.lpd_id
                       AND fl03.pva_id IS NOT NULL
                       AND fl61.source_ab_type_id = md.source_ab_type_id
                       AND fl65.fr_ind_id(+) = md.fr_ind_id
                       AND fl66.single_site_type_id(+) =
                             md.single_site_type_id
                       AND fl67.source_ab_type_id = md.source_ab_type_id
                       AND fl67.receptor_id = md.receptor_id
                       AND NVL (fl67.fr_ind_id, -1) = NVL (md.fr_ind_id, -1)
                       AND NVL (fl67.single_site_type_id, -1) =
                             NVL (md.single_site_type_id, -1))
     SELECT   rd.rbd_code,
              rd.pva_id,
              rd.pva_reference,
              rd.source_ab_type_id,
              rd.source_code,
              rd.description,
              rd.source_code_wise,
              rd.ab_type_id,
              rd.ab_type,
              rd.scenario_id,
              rd.scenario_description,
              rd.probability,
              rd.receptor_id,
              rd.receptor,
              rd.fr_ind_id,
              rd.fr_ind,
              rd.fr_ind_display_name,
              rd.wise_category_consequence,
              rd.wise_code_consequence,
              SUM (rd.VALUE) VALUE,
              rd.single_site_type_id,
              rd.single_site_type,
              rd.single_site_type_display_name,
              SUM (single_site_count) COUNT
       FROM   ref_data rd
      WHERE   (rd.fr_ind_agg_type = 'SUM' OR rd.single_Site_Type_id IS NOT NULL)
   GROUP BY   rd.rbd_code,
              rd.pva_id,
              rd.pva_reference,
              rd.source_ab_type_id,
              rd.source_code,
              rd.description,
              rd.source_code_wise,
              rd.ab_type_id,
              rd.ab_type,
              rd.scenario_id,
              rd.scenario_description,
              rd.probability,
              rd.receptor_id,
              rd.receptor,
              rd.fr_ind_id,
              rd.fr_ind,
              rd.fr_ind_display_name,
              rd.wise_category_consequence,
              rd.wise_code_consequence,
              rd.single_site_type_id,
              rd.single_site_type,
              rd.single_site_type_display_name
   UNION
     SELECT   rd.rbd_code,
              rd.pva_id,
              rd.pva_reference,
              rd.source_ab_type_id,
              rd.source_code,
              rd.description,
              rd.source_code_wise,
              rd.ab_type_id,
              rd.ab_type,
              rd.scenario_id,
              rd.scenario_description,
              rd.probability,
              rd.receptor_id,
              rd.receptor,
              rd.fr_ind_id,
              rd.fr_ind,
              rd.fr_ind_display_name,
              rd.wise_category_consequence,
              rd.wise_code_consequence,
              AVG (rd.VALUE) VALUE,
              rd.single_site_type_id,
              rd.single_site_type,
              rd.single_site_type_display_name,
              SUM (single_site_count) COUNT
       FROM   ref_data rd
      WHERE   rd.single_site_type_id IS NULL AND rd.fr_ind_agg_type = 'AVE'
   GROUP BY   rd.rbd_code,
              rd.pva_id,
              rd.pva_reference,
              rd.source_ab_type_id,
              rd.source_code,
              rd.description,
              rd.source_code_wise,
              rd.ab_type_id,
              rd.ab_type,
              rd.scenario_id,
              rd.scenario_description,
              rd.probability,
              rd.receptor_id,
              rd.receptor,
              rd.fr_ind_id,
              rd.fr_ind,
              rd.fr_ind_display_name,
              rd.wise_category_consequence,
              rd.wise_code_consequence,
              rd.single_site_type_id,
              rd.single_site_type,
              rd.single_site_type_display_name;
