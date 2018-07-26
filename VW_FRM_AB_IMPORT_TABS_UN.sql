--------------------------------------------------------
--  DDL for View VW_FRM_AB_IMPORT_TABS_UN
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_AB_IMPORT_TABS_UN" () AS 
  SELECT 1 source_ab_type_id
         ,fasf.scu_id
         ,To_number (fasf.scenario_description) scenario_id
         ,fasf.ab_res_props_risk
         ,fasf.ab_nonres_props_risk
         ,fasf.num_community_services
         ,fasf.res_props_mon_damages_direct
         ,fasf.num_utilities
         ,fasf.non_res_props_mon_damages_dir
         ,fasf.res_props_mon_damages_indirect
         ,fasf.num_airports
         ,fasf.emerg_mon_damages_indirect
         ,fasf.trans_mon_damages_direct_roads
         ,fasf.hh_sfvi
         ,fasf.agric_mon_damages_direct
         ,fasf.num_ippcs
         ,fasf.veh_mon_damages_direct
         ,fasf.date_derived
         ,fasf.trans_indirect_roads_score
         ,fasf.risk_to_life_no_injuries
         ,fasf.trans_indirect_rail_score
         ,fasf.ch_score
         ,fasf.risk_to_life_fatal_rate
         ,fasf.risk_to_life_rtl
         ,fasf.prot_sites_env_score
   From frm_ab_scu_fluvial fasf
   Union All
   Select 2 source_ab_type_id
         ,fasc.scu_id
         ,To_number (fasc.scenario_description) scenario_id
         ,fasc.ab_res_props_risk
         ,fasc.ab_nonres_props_risk
         ,fasc.num_community_services
         ,fasc.res_props_mon_damages_direct
         ,fasc.num_utilities
         ,fasc.non_res_props_mon_damages_dir
         ,fasc.res_props_mon_damages_indirect
         ,fasc.num_airports
         ,fasc.emerg_mon_damages_indirect
         ,fasc.trans_mon_damages_direct_roads
         ,fasc.hh_sfvi
         ,fasc.agric_mon_damages_direct
         ,fasc.num_ippcs
         ,fasc.veh_mon_damages_direct
         ,fasc.date_derived
         ,fasc.trans_indirect_roads_score
         ,fasc.risk_to_life_no_injuries
         ,fasc.trans_indirect_rail_score
         ,fasc.ch_score
         ,fasc.risk_to_life_fatal_rate
         ,fasc.risk_to_life_rtl
         ,fasc.prot_sites_env_score
   From frm_ab_scu_coastal fasc
   Union All
   Select 3 source_ab_type_id
         ,faspn.scu_id
         ,To_number (faspn.scenario_description) scenario_id
         ,faspn.ab_res_props_risk
         ,faspn.ab_nonres_props_risk
         ,faspn.num_community_services
         ,faspn.res_props_mon_damages_direct
         ,faspn.num_utilities
         ,faspn.non_res_props_mon_damages_dir
         ,To_number (Null) res_props_mon_damages_indirect
         ,faspn.num_airports
         ,faspn.emerg_mon_damages_indirect
         ,To_number (Null) trans_mon_damages_direct_roads
         ,faspn.hh_sfvi
         ,To_number (Null) agric_mon_damages_direct
         ,To_number (Null) num_ippcs
         ,To_number (Null) veh_mon_damages_direct
         ,faspn.date_derived
         ,faspn.trans_indirect_roads_score
         ,To_number (Null) risk_to_life_no_injuries
         ,faspn.trans_indirect_rail_score
         ,faspn.ch_score
         ,To_number (Null) risk_to_life_fatal_rate
         ,To_number (Null) risk_to_life_rtl
         ,To_number (Null) prot_sites_env_score
   From frm_ab_scu_pluvial_nat faspn
   Union All
   Select 4 source_ab_type_id
         ,faspr.scu_id
         ,To_number (faspr.scenario_description) scenario_id
         ,faspr.ab_res_props_risk
         ,faspr.ab_nonres_props_risk
         ,faspr.num_community_services
         ,faspr.res_props_mon_damages_direct
         ,faspr.num_utilities
         ,faspr.non_res_props_mon_damages_dir
         ,To_number (Null) res_props_mon_damages_indirect
         ,faspr.num_airports
         ,faspr.emerg_mon_damages_indirect
         ,faspr.trans_mon_damages_direct_roads
         ,faspr.hh_sfvi
         ,To_number (Null) agric_mon_damages_direct
         ,To_number (Null) num_ippcs
         ,faspr.veh_mon_damages_direct
         ,faspr.date_derived
         ,faspr.trans_indirect_roads_score
         ,faspr.risk_to_life_no_injuries
         ,faspr.trans_indirect_rail_score
         ,faspr.ch_score
         ,faspr.risk_to_life_fatal_rate
         ,faspr.risk_to_life_rtl
         ,To_number (Null) prot_sites_env_score
   From frm_ab_scu_pluvial_reg faspr
   Union All
   Select 5 source_ab_type_id
         ,faspc.scu_id
         ,To_number (faspc.scenario_description) scenario_id
         ,faspc.ab_res_props_risk
         ,faspc.ab_nonres_props_risk
         ,faspc.num_community_services
         ,faspc.res_props_mon_damages_direct
         ,faspc.num_utilities
         ,faspc.non_res_props_mon_damages_dir
         ,To_number (Null) res_props_mon_damages_indirect
         ,faspc.num_airports
         ,faspc.emerg_mon_damages_indirect
         ,faspc.trans_mon_damages_direct_roads
         ,faspc.hh_sfvi
         ,To_number (Null) agric_mon_damages_direct
         ,To_number (Null) num_ippcs
         ,faspc.veh_mon_damages_direct
         ,faspc.date_derived date_derived
         ,faspc.trans_indirect_roads_score
         ,faspc.risk_to_life_no_injuries
         ,faspc.trans_indirect_rail_score
         ,faspc.ch_score
         ,faspc.risk_to_life_fatal_rate
         ,faspc.risk_to_life_rtl
         ,To_number (Null) prot_sites_env_score
   From frm_ab_scu_pluvial_combined faspc
   Union All
   Select 6 source_ab_type_id
         ,fasa.scu_id
         ,To_number (fasa.scenario_description) scenario_id
         ,fasa.ab_res_props_risk
         ,fasa.ab_nonres_props_risk
         ,fasa.num_community_services
         ,To_number (Null) res_props_mon_damages_direct
         ,fasa.num_utilities
         ,To_number (Null) non_res_props_mon_damages_dir
         ,To_number (Null) res_props_mon_damages_indirect
         ,fasa.num_airports
         ,To_number (Null) emerg_mon_damages_indirect
         ,To_number (Null) trans_mon_damages_direct_roads
         ,To_number (Null) hh_sfvi
         ,To_number (Null) agric_mon_damages_direct
         ,fasa.num_ippcs
         ,To_number (Null) veh_mon_damages_direct
         ,fasa.date_derived
         ,To_number (Null) trans_indirect_roads_score
         ,To_number (Null) risk_to_life_no_injuries
         ,To_number (Null) trans_indirect_rail_score
         ,To_number (Null) ch_score
         ,To_number (Null) risk_to_life_fatal_rate
         ,To_number (Null) risk_to_life_rtl
         ,To_number (Null) prot_sites_env_score
   From frm_ab_scu_all fasa;
