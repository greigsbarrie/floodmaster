--------------------------------------------------------
--  DDL for View VW_FPS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FPS" ("SCHEME_ID", "SCHEME_REFERENCE", "SCHEME_NAME", "SCHEME_DESCRIPTION", "LA_ID", "LOCAL_AUTHORITY_NAME", "TOF_ID", "TYPE_OF_FLOODING", "FPA_ID", "FLOOD_PREVENTION_ACT", "PLU_ID", "PREDOMINANT_LAND_USE", "INF_ID", "INSPECTION_FREQUENCY", "COMPLETED", "CATEGORY", "COMMENTS", "TOWN_CITY", "WATERCOURSE", "LENGTH", "EASTING", "NORTHING", "YEAR_OF_CONSTRUCTION", "YEAR_OF_FPS_FPO", "CONSTRUCTION_COST", "COST_BENEFIT_RATIO_AT_CONSTR", "MAINTENANCE_REGIME", "FLOW_DESIGN", "SOP_DESIGN") AS 
  SELECT SF01.SCHEME_ID
                                                ,SF01.SCHEME_REFERENCE
                                                ,SF01.SCHEME_NAME
                                                ,SF01.DESCRIPTION SCHEME_DESCRIPTION
                                                ,SF01.LA_ID
                                                ,GE70.NAME LOCAL_AUTHORITY_NAME
                                                ,SF01.TOF_ID
                                                ,SF29.DESCRIPTION TYPE_OF_FLOODING
                                                ,SF01.FPA_ID
                                                ,SF30.DESCRIPTION FLOOD_PREVENTION_ACT
                                                ,SF01.PLU_ID
                                                ,SF33.DESCRIPTION PREDOMINANT_LAND_USE
                                                ,SF01.INF_ID
                                                ,SF31.DESCRIPTION INSPECTION_FREQUENCY
                                                ,SF02.SCHEME_COMPLETED COMPLETED
                                                ,SF02.CATEGORY
                                                ,SF02.COMMENTS
                                                ,SF02.TOWN_CITY
                                                ,SF02.WATERCOURSE
                                                ,SF02.LENGTH_KM LENGTH
                                                ,SF01.EASTING
                                                ,SF01.NORTHING
                                                ,SF02.DATE_CONSTRUCTION YEAR_OF_CONSTRUCTION
                                                ,SF02.DATE_FPO YEAR_OF_FPS_FPO
                                                ,SF02.CONSTRUCTION_COST
                                                ,SF02.COST_BENEFIT_RATIO COST_BENEFIT_RATIO_AT_CONSTR
                                                ,SF02.MAINTENANCE_REGIME
                                                ,SF02.DESIGN_FLOW FLOW_DESIGN
                                                ,SF02.DESIGN_SOP SOP_DESIGN
                FROM   SF01_FLOOD_PREVENTION_SCHEME SF01
                                                ,SF02_SCHEME_ATTRIBUTES SF02
                                                ,GE70_LOCAL_AUTHORITIES GE70
                                                ,SF29_TYPE_OF_FLOODING SF29
                                                ,SF30_FLOOD_PREVENTION_ACT SF30
                                                ,SF33_PREDOM_LAND_USE SF33
                                                ,SF31_INSPECTION_FREQUENCY SF31
                WHERE SF01.SCHEME_ID = SF02.SCHEME_ID
                                                AND SF01.LA_ID = GE70.LA_ID   
                                                AND SF01.TOF_ID = SF29.TOF_ID
                                                AND SF01.FPA_ID = SF30.FPA_ID
                                                AND SF01.PLU_ID = SF33.PLU_ID
												AND SF01.INF_ID = SF31.INF_ID;
