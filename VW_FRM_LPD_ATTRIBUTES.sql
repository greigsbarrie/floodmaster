--------------------------------------------------------
--  DDL for View VW_FRM_LPD_ATTRIBUTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_LPD_ATTRIBUTES" ("LPD_ID", "LPD_NAME", "ATTRIBUTE_NAME", "DISPLAY_NAME", "ATTRIBUTE_VALUE", "DISPLAY_RANK") AS 
  SELECT "LPD_ID",
            "LPD_NAME",
            "ATTRIBUTE_NAME",
            "DISPLAY_NAME",
            "ATTRIBUTE_VALUE",
            "DISPLAY_RANK"
       FROM (  SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      FL05.ATTRIBUTE_NAME,
                      fl05.display_name DISPLAY_NAME,
                      TO_CHAR(DECODE (
                                 FLC.AGG_TYPE,
                                 'AVG',
                                 AVG(pkg_frm_util.to_numeric (
                                        fl13.attribute_value)),
                                 SUM(pkg_frm_util.to_numeric (
                                        fl13.attribute_value))))
                         ATTRIBUTE_VALUE,
                      fl05.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (fl02.lpd_id = fl03.lpd_id)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                      JOIN FL91_frm_lpd_columns flc
                         ON (    fl05.attribute_name = flc.attribute_name
                             AND FLC.ATTRIBUTE_SOURCE = 'FL05'
                             AND INSTR (FLC.PART_OF_VIEW, 'LPD') > 0)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FL05.ATTRIBUTE_NAME,
                      fl05.display_name,
                      FLC.AGG_TYPE,
                      fl05.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      FRMATTR.DISPLAY_NAME,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(DECODE (
                                        fl05.attribute_name,
                                        frmattr.c2,
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value),
                                        0)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         fl05.attribute_name,
                                         frmattr.c1,
                                         pkg_frm_util.to_numeric (
                                            fl13.attribute_value),
                                         0))
                                  / SUM(DECODE (
                                           fl05.attribute_name,
                                           frmattr.c2,
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value),
                                           0)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'RES_PROPS_RISK' c1,
                                   'RES_PROPS_TOT' c2,
                                   '' c3,
                                   FL5.ATTRIBUTE_NAME,
                                   FL5.DISPLAY_NAME,
                                   FL5.DISPLAY_SEQUENCE
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'RES_PROPS_PERCENT') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      FRMATTR.DISPLAY_NAME,
                      FRMATTR.DISPLAY_SEQUENCE
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      FRMATTR.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(DECODE (
                                        fl05.attribute_name,
                                        frmattr.c2,
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value),
                                        0)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         fl05.attribute_name,
                                         frmattr.c1,
                                         pkg_frm_util.to_numeric (
                                            fl13.attribute_value),
                                         0))
                                  / SUM(DECODE (
                                           fl05.attribute_name,
                                           frmattr.c2,
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value),
                                           0)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'NONRES_PROPS_RISK' c1,
                                   'NONRES_PROPS_TOT' c2,
                                   '' c3,
                                   FL5.ATTRIBUTE_NAME,
                                   FL5.DISPLAY_NAME,
                                   FL5.DISPLAY_SEQUENCE
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'NONRES_PROPS_PERCENT')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      FRMATTR.DISPLAY_NAME,
                      FRMATTR.DISPLAY_SEQUENCE
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      FRMATTR.display_name,
                      TO_CHAR(SUM(DECODE (
                                     fl05.attribute_name,
                                     frmattr.c1,
                                     CASE
                                        WHEN fl03.pva_id IS NOT NULL
                                        THEN
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value)
                                        ELSE
                                           0
                                     END,
                                     0)))
                         attribute_value,
                      FRMATTR.display_sequence DISPLAY_RANK
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'RES_PROPS_RISK' c1,
                                   '' c2,
                                   '' c3,
                                   FL5.ATTRIBUTE_NAME,
                                   FL5.DISPLAY_NAME,
                                   FL5.DISPLAY_SEQUENCE
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'RES_PROPS_RISK_PVA') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      FRMATTR.DISPLAY_NAME,
                      FRMATTR.DISPLAY_SEQUENCE
             --Done
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.ATTRIBUTE_NAME,
                      frmattr.display_name,
                      TO_CHAR(SUM(DECODE (
                                     fl05.attribute_name,
                                     frmattr.c1,
                                     CASE
                                        WHEN FL03.PVA_ID IS NOT NULL
                                        THEN
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value)
                                        ELSE
                                           0
                                     END,
                                     0)))
                         attribute_value,
                      FRMATTR.DISPLAY_SEQUENCE display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'NONRES_PROPS_RISK' c1,
                                   '' c2,
                                   '' c3,
                                   fl5.ATTRIBUTE_NAME,
                                   fl5.DISPLAY_NAME,
                                   FL5.DISPLAY_SEQUENCE
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'NONRES_PROPS_RISK_PVA')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      frmattr.display_sequence
             --Done
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 NVL (
                                    SUM(pkg_frm_util.to_numeric (
                                           fl13.attribute_value)),
                                    0),
                                 0,
                                 0,
                                 (SUM(CASE
                                         WHEN pva_id IS NOT NULL
                                         THEN
                                            pkg_frm_util.to_numeric (
                                               fl13.attribute_value)
                                         ELSE
                                            0
                                      END)
                                  / SUM(pkg_frm_util.to_numeric (
                                           fl13.attribute_value)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'RES_PROPS_RISK' c1,
                                   'NONRES_PROPS_RISK' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'PROPS_IN_PVA_RISK_PERCENT')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      FRMATTR.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR (
                         SUM (pkg_frm_util.to_numeric (fl13.attribute_value)))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'LOWER_AAD_RES' c1,
                                   'LOWER_AAD_NONRES' c2,
                                   '' c3,
                                   FL5.ATTRIBUTE_NAME,
                                   FL5.DISPLAY_NAME,
                                   FL5.DISPLAY_SEQUENCE
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'LOWER_AAD_PROPS') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.ATTRIBUTE_NAME,
                      frmattr.DISPLAY_NAME,
                      frmattr.DISPLAY_SEQUENCE
             --Done
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR (
                         SUM (pkg_frm_util.to_numeric (fl13.attribute_value)))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_RES' c1,
                                   'UPPER_AAD_NONRES' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'UPPER_AAD_PROPS') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             --done
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR (
                         SUM (pkg_frm_util.to_numeric (fl13.attribute_value)))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'LOWER_AAD_RES' c1,
                                   'LOWER_AAD_NONRES' c2,
                                   'LOWER_AAD_AGRIC' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'LOWER_AAD_TOT') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             --Done
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR (
                         SUM (pkg_frm_util.to_numeric (fl13.attribute_value)))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_RES' c1,
                                   'UPPER_AAD_NONRES' c2,
                                   'UPPER_AAD_AGRIC' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'UPPER_AAD_TOT') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             --Done
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR(SUM(CASE
                                     WHEN FL03.PVA_ID IS NOT NULL
                                     THEN
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value)
                                     ELSE
                                        0
                                  END))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_RES' c1,
                                   '' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'UPPER_AAD_RES_PVA') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR(SUM(CASE
                                     WHEN FL03.PVA_ID IS NOT NULL
                                     THEN
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value)
                                     ELSE
                                        0
                                  END))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_NONRES' c1,
                                   '' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'UPPER_AAD_NONRES_PVA')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR(SUM(CASE
                                     WHEN FL03.PVA_ID IS NOT NULL
                                     THEN
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value)
                                     ELSE
                                        0
                                  END))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_AGRIC' c1,
                                   'UPPER_AAD_NONRES' c2,
                                   'UPPER_AAD_RES' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'UPPER_AAD_TOT_PVA') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR(SUM(CASE
                                     WHEN FL03.PVA_ID IS NOT NULL
                                     THEN
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value)
                                     ELSE
                                        0
                                  END))
                         attribute_value,
                      frmattr.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_AGRIC' c1,
                                   '' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'UPPER_AAD_AGRIC_PVA')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                        FL13.ATTRIBUTE_VALUE)),
                                 0,
                                 0,
                                 (SUM(CASE
                                         WHEN FL03.PVA_ID IS NOT NULL
                                         THEN
                                            pkg_frm_util.to_numeric (
                                               fl13.attribute_value)
                                         ELSE
                                            0
                                      END)
                                  / SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                           FL13.ATTRIBUTE_VALUE)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'UPPER_AAD_AGRIC' c1,
                                   'UPPER_AAD_NONRES' c2,
                                   'UPPER_AAD_RES' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'AAD_IN_PVAS_PERCENT')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             --dONE
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(DECODE (
                                        FL05.ATTRIBUTE_NAME,
                                        FRMATTR.C2,
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value),
                                        0)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         FL05.ATTRIBUTE_NAME,
                                         FRMATTR.C1,
                                         pkg_frm_util.to_numeric (
                                            fl13.attribute_value),
                                         0))
                                  / SUM(DECODE (
                                           FL05.ATTRIBUTE_NAME,
                                           FRMATTR.C2,
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value),
                                           0)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'URBAN_AREA' c1,
                                   'TOTAL_AREA' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'URBAN_AREA_PERCENT') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(DECODE (
                                        FL05.ATTRIBUTE_NAME,
                                        FRMATTR.C2,
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value),
                                        0)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         FL05.ATTRIBUTE_NAME,
                                         FRMATTR.C1,
                                         pkg_frm_util.to_numeric (
                                            fl13.attribute_value),
                                         0))
                                  / SUM(DECODE (
                                           FL05.ATTRIBUTE_NAME,
                                           FRMATTR.C2,
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value),
                                           0)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'FOREST_AREA' c1,
                                   'TOTAL_AREA' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'FOREST_AREA_PERCENT')
                           frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             --dONE
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(DECODE (
                                        FL05.ATTRIBUTE_NAME,
                                        FRMATTR.C2,
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value),
                                        0)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         FL05.ATTRIBUTE_NAME,
                                         FRMATTR.C1,
                                         pkg_frm_util.to_numeric (
                                            fl13.attribute_value),
                                         0))
                                  / SUM(DECODE (
                                           FL05.ATTRIBUTE_NAME,
                                           FRMATTR.C2,
                                           pkg_frm_util.to_numeric (
                                              fl13.attribute_value),
                                           0)))
                                 * 100),
                              '99999999999999999999999.99'))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'AGRIC_AREA' c1,
                                   'TOTAL_AREA' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'AGRIC_AREA_PERCENT') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT fl02.lpd_id,
                      fl02.lpd_name,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR(SUM(CASE
                                     WHEN FL03.PVA_ID IS NOT NULL
                                     THEN
                                        pkg_frm_util.to_numeric (
                                           fl13.attribute_value)
                                     ELSE
                                        0
                                  END))
                         attribute_value,
                      FRMATTR.display_sequence display_rank
                 FROM fl02_local_plan_districts fl02
                      JOIN fl03_frm_sub_catchment_units fl03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN (SELECT 'TOTAL_AREA' c1,
                                   '' c2,
                                   '' c3,
                                   fl5.attribute_name,
                                   fl5.display_name,
                                   fl5.display_sequence
                              FROM FL05_FRM_SCU_ATTRIBUTES FL5
                             WHERE ATTRIBUTE_NAME = 'TOTAL_AREA_PVA') frmattr
                         ON (1 = 1)
                      JOIN fl13_scu_attr_values fl13
                         ON (fl03.scu_id = fl13.scu_id)
                      JOIN fl05_frm_scu_attributes fl05
                         ON (fl13.attribute_id = fl05.attribute_id)
                WHERE fl05.attribute_name IN (c1, c2, c3)
             GROUP BY fl02.lpd_id,
                      fl02.lpd_name,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT FL02.LPD_ID,
                      FL02.LPD_NAME,
                      FL06.ATTRIBUTE_NAME,
                      FL06.DISPLAY_NAME,
                      TO_CHAR (SUM (FL14.ATTRIBUTE_VALUE)) ATTRIBUTE_VALUE,
                      FL06.DISPLAY_SEQUENCE
                      + (SELECT NVL (MAX (display_sequence), 0)
                           FROM FL05_FRM_SCU_ATTRIBUTES)
                         DISPLAY_RANK
                 FROM FL02_LOCAL_PLAN_DISTRICTS FL02
                      JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN FL04_RISK_CELLS FL04
                         ON (FL03.SCU_ID = FL04.SCU_ID)
                      JOIN FL14_RISK_CELL_ATTR_VALUES FL14
                         ON (FL04.CELL_ID = FL14.CELL_ID)
                      JOIN FL06_FRM_RISK_CELL_ATTRIBUTES FL06
                         ON (FL14.ATTRIBUTE_ID = FL06.ATTRIBUTE_ID)
                      JOIN FL91_frm_lpd_columns flc
                         ON (    fl06.attribute_name = flc.attribute_name
                             AND FLC.ATTRIBUTE_SOURCE = 'FL06'
                             AND INSTR (FLC.PART_OF_VIEW, 'LPD') > 0)
             GROUP BY FL02.LPD_ID,
                      FL02.LPD_NAME,
                      FL06.ATTRIBUTE_NAME,
                      FL06.DISPLAY_NAME,
                      FL06.DISPLAY_SEQUENCE
             UNION ALL
               SELECT FL02.LPD_ID,
                      FL02.LPD_NAME,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TO_CHAR (SUM (FL14.ATTRIBUTE_VALUE)) ATTRIBUTE_VALUE,
                      FRMATTR.display_sequence
                      + (SELECT NVL (MAX (display_sequence), 0)
                           FROM FL05_FRM_SCU_ATTRIBUTES)
                         DISPLAY_RANK
                 FROM FL02_LOCAL_PLAN_DISTRICTS FL02
                      JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN FL04_RISK_CELLS FL04
                         ON (FL03.SCU_ID = FL04.SCU_ID)
                      JOIN FL14_RISK_CELL_ATTR_VALUES FL14
                         ON (FL04.CELL_ID = FL14.CELL_ID)
                      JOIN (SELECT 'COASTAL_TOT_SCORE' C1,
                                   'RIVER_TOT_SCORE' C2,
                                   'SURFACEWATER_TOT_SCORE' C3,
                                   fl6.attribute_name,
                                   fl6.display_name,
                                   fl6.display_sequence
                              FROM FL06_FRM_RISK_CELL_ATTRIBUTES FL6
                             WHERE ATTRIBUTE_NAME = 'SOURCES_TOTAL_SCORE')
                           FRMATTR
                         ON (1 = 1)
                      JOIN FL06_FRM_RISK_CELL_ATTRIBUTES FL06
                         ON (FL14.ATTRIBUTE_ID = FL06.ATTRIBUTE_ID)
                WHERE FL06.ATTRIBUTE_NAME IN (FRMATTR.C2, FRMATTR.C1, FRMATTR.C3)
             GROUP BY FL02.LPD_ID,
                      FL02.LPD_NAME,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT FL02.LPD_ID,
                      FL02.LPD_NAME,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                        FL14.ATTRIBUTE_VALUE)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         FL06.ATTRIBUTE_NAME,
                                         FRMATTR.C1,
                                         PKG_FRM_UTIL.TO_NUMERIC (
                                            FL14.ATTRIBUTE_VALUE),
                                         0)))
                                 / SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                          FL14.ATTRIBUTE_VALUE)))
                              * 100,
                              '99999999999999999999999.99'))
                         ATTRIBUTE_VALUE,
                      FRMATTR.display_sequence
                      + (SELECT NVL (MAX (display_sequence), 0)
                           FROM FL05_FRM_SCU_ATTRIBUTES)
                         DISPLAY_RANK
                 FROM FL02_LOCAL_PLAN_DISTRICTS FL02
                      JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN FL04_RISK_CELLS FL04
                         ON (FL03.SCU_ID = FL04.SCU_ID)
                      JOIN FL14_RISK_CELL_ATTR_VALUES FL14
                         ON (FL04.CELL_ID = FL14.CELL_ID)
                      JOIN (SELECT 'COASTAL_TOT_SCORE' C1,
                                   'RIVER_TOT_SCORE' C2,
                                   'SURFACEWATER_TOT_SCORE' C3,
                                   fl6.attribute_name,
                                   fl6.display_name,
                                   fl6.display_sequence
                              FROM FL06_FRM_RISK_CELL_ATTRIBUTES FL6
                             WHERE ATTRIBUTE_NAME = 'COASTAL_SOURCE_PERCENT')
                           FRMATTR
                         ON (1 = 1)
                      JOIN FL06_FRM_RISK_CELL_ATTRIBUTES FL06
                         ON (FL14.ATTRIBUTE_ID = FL06.ATTRIBUTE_ID)
                WHERE FL06.ATTRIBUTE_NAME IN (FRMATTR.C2, FRMATTR.C1, FRMATTR.C3)
             GROUP BY FL02.LPD_ID,
                      FL02.LPD_NAME,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT FL02.LPD_ID,
                      FL02.LPD_NAME,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                        FL14.ATTRIBUTE_VALUE)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         FL06.ATTRIBUTE_NAME,
                                         FRMATTR.C2,
                                         PKG_FRM_UTIL.TO_NUMERIC (
                                            FL14.ATTRIBUTE_VALUE),
                                         0)))
                                 / SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                          FL14.ATTRIBUTE_VALUE)))
                              * 100,
                              '99999999999999999999999.99'))
                         ATTRIBUTE_VALUE,
                      FRMATTR.display_sequence
                      + (SELECT NVL (MAX (display_sequence), 0)
                           FROM FL05_FRM_SCU_ATTRIBUTES)
                         DISPLAY_RANK
                 FROM FL02_LOCAL_PLAN_DISTRICTS FL02
                      JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN FL04_RISK_CELLS FL04
                         ON (FL03.SCU_ID = FL04.SCU_ID)
                      JOIN FL14_RISK_CELL_ATTR_VALUES FL14
                         ON (FL04.CELL_ID = FL14.CELL_ID)
                      JOIN (SELECT 'COASTAL_TOT_SCORE' C1,
                                   'RIVER_TOT_SCORE' C2,
                                   'SURFACEWATER_TOT_SCORE' C3,
                                   fl6.attribute_name,
                                   fl6.display_name,
                                   fl6.display_sequence
                              FROM FL06_FRM_RISK_CELL_ATTRIBUTES FL6
                             WHERE ATTRIBUTE_NAME = 'RIVER_SOURCE_PERCENT')
                           FRMATTR
                         ON (1 = 1)
                      JOIN FL06_FRM_RISK_CELL_ATTRIBUTES FL06
                         ON (FL14.ATTRIBUTE_ID = FL06.ATTRIBUTE_ID)
                WHERE FL06.ATTRIBUTE_NAME IN (FRMATTR.C2, FRMATTR.C1, FRMATTR.C3)
             GROUP BY FL02.LPD_ID,
                      FL02.LPD_NAME,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence
             UNION ALL
               SELECT FL02.LPD_ID,
                      FL02.LPD_NAME,
                      frmattr.attribute_name,
                      frmattr.display_name,
                      TRIM(TO_CHAR (
                              DECODE (
                                 SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                        FL14.ATTRIBUTE_VALUE)),
                                 0,
                                 0,
                                 (SUM(DECODE (
                                         FL06.ATTRIBUTE_NAME,
                                         FRMATTR.C3,
                                         PKG_FRM_UTIL.TO_NUMERIC (
                                            FL14.ATTRIBUTE_VALUE),
                                         0)))
                                 / SUM(PKG_FRM_UTIL.TO_NUMERIC (
                                          FL14.ATTRIBUTE_VALUE)))
                              * 100,
                              '99999999999999999999999.99'))
                         ATTRIBUTE_VALUE,
                      FRMATTR.display_sequence
                      + (SELECT NVL (MAX (display_sequence), 0)
                           FROM FL05_FRM_SCU_ATTRIBUTES)
                         DISPLAY_RANK
                 FROM FL02_LOCAL_PLAN_DISTRICTS FL02
                      JOIN FL03_FRM_SUB_CATCHMENT_UNITS FL03
                         ON (FL02.LPD_ID = FL03.LPD_ID)
                      JOIN FL04_RISK_CELLS FL04
                         ON (FL03.SCU_ID = FL04.SCU_ID)
                      JOIN FL14_RISK_CELL_ATTR_VALUES FL14
                         ON (FL04.CELL_ID = FL14.CELL_ID)
                      JOIN (SELECT 'COASTAL_TOT_SCORE' C1,
                                   'RIVER_TOT_SCORE' C2,
                                   'SURFACEWATER_TOT_SCORE' C3,
                                   fl6.attribute_name,
                                   fl6.display_name,
                                   fl6.display_sequence
                              FROM FL06_FRM_RISK_CELL_ATTRIBUTES FL6
                             WHERE ATTRIBUTE_NAME = 'SURFACEWATER_SOURCE_PERCENT')
                           FRMATTR
                         ON (1 = 1)
                      JOIN FL06_FRM_RISK_CELL_ATTRIBUTES FL06
                         ON (FL14.ATTRIBUTE_ID = FL06.ATTRIBUTE_ID)
                WHERE FL06.ATTRIBUTE_NAME IN (FRMATTR.C2, FRMATTR.C1, FRMATTR.C3)
             GROUP BY FL02.LPD_ID,
                      FL02.LPD_NAME,
                      FRMATTR.attribute_name,
                      FRMATTR.display_name,
                      frmattr.display_sequence)
   ORDER BY lpd_id, display_rank
 ;
