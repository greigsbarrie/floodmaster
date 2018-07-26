--------------------------------------------------------
--  DDL for View VW_FRM_PVA_IMPACTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_PVA_IMPACTS" ("PVA_ID", "IMPACT_TYPE", "WISE_CODE", "IMPACT_CATEGORY") AS 
  SELECT fl23.pva_id,
            fl53.description impact_type,
            fl53.impact_code_hh_wise wise_code,
            'HumanHealthSocial' impact_category
     from      fl23_pva_impacts_hh fl23
            join
               fl53_impacts_human_health fl53
            on (fl23.impact_code_hh = fl53.impact_code_hh)
   union all
   select   fl24.pva_id,
            fl54.description impact_type,
            fl54.impact_code_env_wise wise_code,
            'Environment' impact_category
     from      fl24_pva_impacts_env fl24
            join
               fl54_impacts_environment fl54
            on (fl24.impact_code_env = fl54.impact_code_env)
   union all
   select   fl25.pva_id,
            fl55.description impact_type,
            fl55.impact_code_ch_wise wise_code,
            'CulturalHeritage' impact_category
     from      fl25_pva_impacts_ch fl25
            join
               fl55_impacts_ch fl55
            on (fl25.impact_code_ch = fl55.impact_code_ch)
   union all
   select   fl26.pva_id,
            fl56.description impact_type,
            fl56.impact_code_econ_wise wise_code,
            'EconomicActivity' impact_category
     from      fl26_pva_impacts_econ fl26
            join
               fl56_impacts_economy fl56
            on (fl26.impact_code_econ = fl56.impact_code_econ)
 ;
