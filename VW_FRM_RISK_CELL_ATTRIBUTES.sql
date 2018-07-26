--------------------------------------------------------
--  DDL for View VW_FRM_RISK_CELL_ATTRIBUTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_RISK_CELL_ATTRIBUTES" ("CELL_ID", "ATTRIBUTE_NAME", "DISPLAY_NAME", "ATTRIBUTE_VALUE", "DISPLAY_RANK") AS 
  SELECT fl14.cell_id,
          FL06.ATTRIBUTE_NAME,
          FL06.DISPLAY_name,
          FL14.ATTRIBUTE_VALUE,
          fl06.display_sequence DISPLAY_RANK
     FROM    fl14_risk_cell_attr_values fl14
          JOIN
             fl06_frm_risk_cell_attributes fl06
          ON (FL14.ATTRIBUTE_ID = FL06.ATTRIBUTE_ID)
   where fl06.publish_yn = 'Y'
    ORDER BY FL14.CELL_ID,FL06.DISPLAY_SEQUENCE
 ;
