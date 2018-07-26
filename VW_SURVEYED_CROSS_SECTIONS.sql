--------------------------------------------------------
--  DDL for View VW_SURVEYED_CROSS_SECTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_SURVEYED_CROSS_SECTIONS" ("SCHEME_ID", "SCHEME_NAME", "SCHEME_REFERENCE", "SCS_ID", "SCS_REFERENCE", "RIVER", "REACH", "CROSS_SECTION") AS 
  SELECT SF01.SCHEME_ID
          ,SF01.SCHEME_NAME
          ,SF01.SCHEME_REFERENCE
          ,SF16.SCS_ID
          ,SF16.SCS_REFERENCE
         ,SF16.RIVER
          ,SF16.REACH
          ,SF16.CROSS_SECTION
            FROM 
          SF16_SURVEYED_CROSS_SECTION SF16
          ,SF01_FLOOD_PREVENTION_SCHEME SF01
            WHERE
          SF16.SCHEME_ID = SF01.SCHEME_ID;
