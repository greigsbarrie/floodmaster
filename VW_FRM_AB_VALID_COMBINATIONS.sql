--------------------------------------------------------
--  DDL for View VW_FRM_AB_VALID_COMBINATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_VALID_COMBINATIONS" ("SOURCE_AB_TYPE_ID", "SOURCE_CODE", "DESCRIPTION", "AB_TYPE_ID", "AB_TYPE", "RECEPTOR_ID", "RECEPTOR", "FR_IND_ID", "FR_IND", "FR_IND_DISPLAY_NAME", "SINGLE_SITE_TYPE_ID", "SINGLE_SITE_TYPE", "SINGLE_SITE_TYPE_DISPLAY_NAME", "LOAD_TABLE_COLUMN_NAME") AS 
  SELECT fl67.source_ab_type_id
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
         ,fl67.receptor_id
         , (Select fl64.receptor
            From fl64_receptors fl64
            Where fl64.receptor_id = fl67.receptor_id)
             receptor
         ,fl67.fr_ind_id
         ,fl65.fr_ind
         ,fl65.fr_ind_display_name
         ,fl67.single_site_type_id
         ,fl66.single_site_type
         ,fl66.single_site_type_display_name
         ,fl67.load_table_column_name
   From fl67_ab_valid_combinations fl67
       ,fl61_source_ab_types fl61
       ,fl65_flood_risk_indicators fl65
       ,fl66_single_site_types fl66
   Where fl67.source_ab_type_id = fl61.source_ab_type_id
     And fl67.fr_ind_id = fl65.fr_ind_id(+)
     And fl67.single_site_type_id = fl66.single_site_type_id(+);
