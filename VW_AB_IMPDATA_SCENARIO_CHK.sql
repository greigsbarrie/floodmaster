--------------------------------------------------------
--  DDL for View VW_AB_IMPDATA_SCENARIO_CHK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_AB_IMPDATA_SCENARIO_CHK" ("SOURCE_AB_TYPE_ID", "SCENARIO_ID", "SCENARIO_DESCRIPTION", "SCU_ID", "SCENARIO_EXISTS") AS 
  SELECT imd.source_ab_type_id
         ,sc.scenario_id
         ,imd.scenario_description
         ,imd.scu_id
         ,Nvl2 (sc.scenario_id, 'Y', 'N') scenario_exists
   From (Select td.scu_id, td.source_ab_type_id, Upper (Trim (Nvl (td.scenario_desc, 'Annualised Assessment'))) scenario_description
         From table (frm_pkg02_ab_import.ft_import_preview) td) imd
       , (Select fl61.source_ab_type_id, fl62.scenario_id, Upper (fl62.scenario_description) scenario_description
          From fl61_source_ab_types fl61, fl62_scenarios fl62) sc
   Where sc.source_ab_type_id(+) = imd.source_ab_type_id
     And sc.scenario_description(+) = imd.scenario_description;
