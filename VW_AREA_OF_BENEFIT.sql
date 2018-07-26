--------------------------------------------------------
--  DDL for View VW_AREA_OF_BENEFIT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_AREA_OF_BENEFIT" ("SCHEME_ID", "SCHEME_NAME", "SCHEME_REFERENCE", "AOB_ID", "AOB_REFERENCE", "SOP", "AOB_AREA", "COMMENTS", "PRB_ID", "PRODUCED_BY") AS 
  SELECT SF01.SCHEME_ID
          ,SF01.SCHEME_NAME
          ,SF01.SCHEME_REFERENCE
          ,SF05.AOB_ID
          ,SF05.AOB_REFERENCE
          ,SF05.SOP
          ,SF05.AOB_AREA
          ,SF05.COMMENTS
          ,SF05.PRB_ID
          ,SF34.DESCRIPTION PRODUCED_BY
                FROM     SF01_FLOOD_PREVENTION_SCHEME SF01
          ,SF05_AREA_OF_BENEFIT SF05
          ,SF34_PRODUCED_BY SF34
                WHERE   SF05.SCHEME_ID = SF01.SCHEME_ID
          AND SF05.PRB_ID = SF34.PRB_ID;
