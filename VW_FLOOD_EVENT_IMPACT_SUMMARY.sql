--------------------------------------------------------
--  DDL for View VW_FLOOD_EVENT_IMPACT_SUMMARY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FLOOD_EVENT_IMPACT_SUMMARY" ("EVENT_ID", "IMPACT_TYPE", "SIGNIFICANCE", "WISE_CODE", "IMPACT_CATEGORY") AS 
  SELECT fl43.event_id event_id,
            fl53.description impact_type,
            fl43.significance significance,
            fl53.impact_code_hh_wise wise_code,
            'HumanHealthSocial' impact_category
     from      fl43
            join
               fl53
            on (fl43.impact_code_hh = fl53.impact_code_hh)
   union all
   select   fl44.event_id,
            fl54.description,
            fl44.significance,
            fl54.impact_code_env_wise wise_code,
            'Environment' impact_category
     from      fl44
            join
               fl54
            on (fl44.impact_code_env = fl54.impact_code_env)
   union all
   select   fl45.event_id,
            fl55.description,
            fl45.significance,
            fl55.impact_code_ch_wise wise_code,
            'CulturalHeritage' impact_category
     from      fl45
            join
               fl55
            on (fl45.impact_code_ch = fl55.impact_code_ch)
   union all
   select   fl46.event_id,
            fl56.description,
            fl46.significance,
            fl56.impact_code_econ_wise wise_code,
            'EconomicActivity' impact_category
     from      fl46
            join
               fl56
            on (fl46.impact_code_econ = fl56.impact_code_econ)
 ;
