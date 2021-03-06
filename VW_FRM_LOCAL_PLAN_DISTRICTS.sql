--------------------------------------------------------
--  DDL for View VW_FRM_LOCAL_PLAN_DISTRICTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_LOCAL_PLAN_DISTRICTS" ("LPD_ID", "LPD_NAME", "RBD_CODE", "RBD_NAME", "LEAD_LA_ID", "LEAD_LA", "DATE_DERIVED", "GEOGRAPHIC_EXTENT", "TOTAL_AREA_KM2") AS 
  SELECT FL02.LPD_ID LPD_ID,
          FL02.LPD_NAME  LPD_NAME,
          FL02.RBD_CODE RBD_CODE,
          WF39.NAME RBD_NAME,
          FL02.LEAD_LA_ID LEAD_LA_ID,
          GE70.NAME LEAD_LA,
          FL02.DATE_DERIVED DATE_DERIVED,
          FL02.GEOGRAPHIC_EXTENT GEOGRAPHIC_EXTENT,
           (SELECT SUM (PKG_FRM_UTIL.TO_NUMERIC(ATTRIBUTE_VALUE)) SM
             FROM    FL13_SCU_ATTR_VALUES FL13
                  JOIN
                     FL05_FRM_SCU_ATTRIBUTES FL05
                  ON (    FL13.ATTRIBUTE_ID = FL05.ATTRIBUTE_ID
                      AND FL05.PUBLISH_YN = 'Y'
                      AND ATTRIBUTE_NAME = 'TOTAL_AREA')
                  JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL3
                  ON(FL13.SCU_ID=FL3.SCU_ID)
                  WHERE FL3.LPD_ID=FL02.LPD_ID
                  )
             TOTAL_AREA_KM2
     FROM FL02_LOCAL_PLAN_DISTRICTS FL02
          LEFT JOIN GE70_LOCAL_AUTHORITIES GE70
             ON (FL02.LEAD_LA_ID = GE70.LA_ID)
          LEFT JOIN WF39_RIVER_BASIN_DISTRICTS WF39
             ON (FL02.RBD_CODE = WF39.RBD_CODE)
 ;
