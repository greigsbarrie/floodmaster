--------------------------------------------------------
--  DDL for View VW_FRM_LOCAL_AUTHORITIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_LOCAL_AUTHORITIES" ("SCU_ID", "SCU_REFERENCE", "PVA_ID", "PVA_REFERENCE", "LPD_ID", "LPD_NAME", "LA_ID", "LA_NAME") AS 
  SELECT fl03.scu_id,
          fl03.scu_reference,
          fl01.pva_id,
          fl01.pva_reference,
          fl02.lpd_id,
          fl02.lpd_name,
          fl10.la_id,
          ge70.name la_name
     FROM fl03_frm_sub_catchment_units fl03
          JOIN fl02_local_plan_districts fl02
             ON (fl03.lpd_id = fl02.lpd_id)
          JOIN fl10_scu_las fl10
             ON (fl03.scu_id = fl10.scu_id)
          JOIN ge70_local_authorities ge70
             ON (FL10.LA_ID = ge70.la_id)
          LEFT JOIN fl01_pvas fl01
             ON (fl03.pva_id = fl01.pva_id)
 ;
