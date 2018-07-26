--------------------------------------------------------
--  DDL for View VW_FRM_RISK_CELLS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_RISK_CELLS" ("CELL_ID", "RBD_CODE", "RBD_NAME", "LPD_ID", "LPD_NAME", "PVA_ID", "PVA_REFERENCE", "SCU_ID", "SCU_REFERENCE", "DATE_DERIVED", "FINAL_SCORE") AS 
  SELECT FL04.CELL_ID,
          FL02.RBD_CODE,
          WF39.NAME RBD_NAME,
          FL02.LPD_ID,
          FL02.LPD_NAME,
          FL03.PVA_ID,
          FL01.PVA_REFERENCE,
          FL04.SCU_ID,
          FL03.SCU_REFERENCE,
          FL04.DATE_DERIVED,
          (SELECT PKG_FRM_UTIL.TO_NUMERIC(FL14.ATTRIBUTE_VALUE)
             FROM FL14_RISK_CELL_ATTR_VALUES FL14
            WHERE FL14.ATTRIBUTE_ID IN
                        (SELECT ATTRIBUTE_ID
                           FROM FL06_FRM_RISK_CELL_ATTRIBUTES FL06
                          WHERE ATTRIBUTE_NAME = 'FINAL_SCORE')
                  AND FL14.CELL_ID = Fl04.CELL_ID)
             FINAL_SCORE
     FROM FL04_RISK_CELLS FL04
          JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL03
             ON (FL04.SCU_ID = FL03.SCU_ID)
          JOIN FL02_LOCAL_PLAN_DISTRICTS FL02
             ON (FL03.LPD_ID = FL02.LPD_ID)
          JOIN WF39_RIVER_BASIN_DISTRICTS WF39
             ON (FL02.RBD_CODE = WF39.RBD_CODE)
          LEFT JOIN FL01_PVAS FL01
             ON (FL03.PVA_ID = FL01.PVA_ID)
 ;
