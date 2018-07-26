--------------------------------------------------------
--  DDL for View VW_FLOOD_EVENT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FLOOD_EVENT_TYPE" ("EVENT_ID", "TYPE", "VALUE", "WISE_CODE") AS 
  SELECT FL40.EVENT_ID EVENT_ID,
          'Source' TYPE,
          description VALUE,
          source_code_wise WISE_CODE
     FROM FL40 JOIN FL50
             ON (FL40.SOURCE_CODE = FL50.SOURCE_CODE)
   UNION ALL
   SELECT FL41.EVENT_ID,
          'Cause' TYPE,
          Description VALUE,
          cause_code_wise wise_code
     FROM fl41 JOIN fl51
             ON (fl41.cause_code = fl51.cause_code)
   UNION ALL
   SELECT FL42.EVENT_ID EVENT_ID,
          'Characteristic' TYPE,
          Description VALUE,
          CHARACTERISTIC_CODE_WISE wise_code
     FROM fl42 JOIN fl52
             ON (FL42.CHARACTERISTIC_CODE = FL52.CHARACTERISTIC_CODE)
 ;
