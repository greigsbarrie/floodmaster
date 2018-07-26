--------------------------------------------------------
--  DDL for View VW_FRM_SCU_ATTRIBUTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_SCU_ATTRIBUTES" ("SCU_ID", "SCU_REFERENCE", "ATTRIBUTE_NAME", "DISPLAY_NAME", "ATTRIBUTE_VALUE", "DISPLAY_RANK") AS 
  select "SCU_ID",
          "SCU_REFERENCE",
          "ATTRIBUTE_NAME",
          "DISPLAY_NAME",
          "ATTRIBUTE_VALUE",
          "DISPLAY_RANK"
   from (select fl03.scu_id,
         fl03.scu_reference,
         fl05.attribute_name,
         fl05.display_name,
         fl13.attribute_value,
         fl05.display_sequence display_rank
         from       fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id)
         where fl05.publish_yn = 'Y'
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         trim (to_char (decode (sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)),
            0, 0,
            (sum(decode (fl05.attribute_name,
            frm_attrs.c1, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)) / sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)))) * 100,
         '999999999999999999999999999.99'
         )
         )
            as res_props_percent,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'RES_PROPS_RISK' c1,
         'RES_PROPS_TOT' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'RES_PROPS_PERCENT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id)
         where fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2)
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         trim (to_char (decode (sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)),
            0, 0,
            (sum(decode (fl05.attribute_name,
            frm_attrs.c1, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)) / sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)))) * 100,
         '99999999999999999999999.99'
         )
         )
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'NONRES_PROPS_RISK' c1,
         'NONRES_PROPS_TOT' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'NONRES_PROPS_PERCENT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         to_char (sum (floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value)))
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'LOWER_AAD_RES' c1,
         'LOWER_AAD_NONRES' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'LOWER_AAD_PROPS') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         to_char (sum (floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value)))
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'UPPER_AAD_RES' c1,
         'UPPER_AAD_NONRES' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'UPPER_AAD_PROPS') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         to_char (round (sum(floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         )),
         -4
         )
         )
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'LOWER_AAD_RES' c1,
         'LOWER_AAD_NONRES' c2,
         'LOWER_AAD_AGRIC' c4,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'LOWER_AAD_TOT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2, frm_attrs.
         c4))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         to_char (round (sum(floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         )),
         -4
         )
         )
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'UPPER_AAD_RES' c1,
         'UPPER_AAD_NONRES' c2,
         'UPPER_AAD_AGRIC' c4,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'UPPER_AAD_TOT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2, frm_attrs.
         c4))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         trim (to_char (decode (sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)),
            0, 0,
            (sum(decode (fl05.attribute_name,
            frm_attrs.c1, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)) / sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)))) * 100,
         '99999999999999999999999.99'
         )
         )
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'URBAN_AREA' c1,
         'TOTAL_AREA' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'URBAN_AREA_PERCENT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         trim (to_char (decode (sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)),
            0, 0,
            (sum(decode (fl05.attribute_name,
            frm_attrs.c1, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)) / sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)))) * 100,
         '99999999999999999999999.99'
         )
         )
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'AGRIC_AREA' c1,
         'TOTAL_AREA' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'AGRIC_AREA_PERCENT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         trim (to_char ( (sum(decode (fl05.attribute_name,
            frm_attrs.c1, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0)) / sum(decode (fl05.attribute_name,
            frm_attrs.c2, floodmaster.pkg_frm_util.to_numeric (fl13.attribute_value
         ),
            0))) * 100,
         '99999999999999999999999.99'
         )
         )
            as attribute_value,
         frm_attrs.display_sequence display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl13_scu_attr_values fl13
         on (fl03.scu_id = fl13.scu_id)
         join
            (select 'FOREST_AREA' c1,
         'TOTAL_AREA' c2,
         fl5.attribute_name,
         fl5.display_name,
         fl5.display_sequence
             from fl05_frm_scu_attributes fl5
             where attribute_name = 'FOREST_AREA_PERCENT') frm_attrs
         on (1 = 1)
         join
            fl05_frm_scu_attributes fl05
         on (fl13.attribute_id = fl05.attribute_id
         and fl05.attribute_name in (frm_attrs.c1, frm_attrs.c2))
         group by fl03.scu_id,
         fl03.scu_reference,
         frm_attrs.attribute_name,
         frm_attrs.display_name,
         frm_attrs.display_sequence
         having count ( * ) > 1
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         fl06.attribute_name,
         fl06.display_name,
         to_char(decode (flc.agg_type,
            'AVG', avg(floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         )),
            sum (floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value))))
            attribute_value,
         (      select nvl (max (display_sequence), 0)
                from fl05) + fl06.display_sequence
            display_rank
         from             fl03_frm_sub_catchment_units fl03
         join
            fl04_risk_cells fl04
         on (fl03.scu_id = fl04.scu_id)
         join
            fl14_risk_cell_attr_values fl14
         on (fl04.cell_id = fl14.cell_id)
         join
            fl06_frm_risk_cell_attributes fl06
         on (fl14.attribute_id = fl06.attribute_id)
         join
            fl91_frm_lpd_columns flc
         on (    fl06.attribute_name = flc.attribute_name
         and flc.attribute_source = 'FL06'
         and instr (flc.part_of_view,
         'SCU'
         ) > 0)
         group by fl03.scu_id,
         fl03.scu_reference,
         fl06.display_sequence,
         fl06.attribute_name,
         fl06.display_name,
         flc.agg_type
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         'SOURCES_TOTAL_SCORE' attribute_name,
         (      select display_name
                from fl06_frm_risk_cell_attributes fl6
                where attribute_name = 'SOURCES_TOTAL_SCORE')
            display_name,
         to_char (sum (floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value)))
            attribute_value,
         (      select nvl (max (display_sequence), 0)
                from fl05) + (select display_sequence
                              from fl06_frm_risk_cell_attributes fl6
                              where attribute_name = 'SOURCES_TOTAL_SCORE')
            display_rank
         from          fl03_frm_sub_catchment_units fl03
         join
            fl04_risk_cells fl04
         on (fl03.scu_id = fl04.scu_id)
         join
            fl14_risk_cell_attr_values fl14
         on (fl04.cell_id = fl14.cell_id)
         join
            fl06_frm_risk_cell_attributes fl06
         on (fl14.attribute_id = fl06.attribute_id)
         where attribute_name in ('RIVER_TOT_SCORE', 'COASTAL_TOT_SCORE',
         'SURFACEWATER_TOT_SCORE')
         group by fl03.scu_id,
         fl03.scu_reference
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frmattr.attribute_name,
         frmattr.display_name,
         trim (to_char (decode (sum(floodmaster.pkg_frm_util.to_numeric (fl14.
         attribute_value
         )),
            0, 0,
            (sum(decode (fl06.attribute_name,
            frmattr.c1, floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         ),
            0)) / sum(floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         ))) * 100),
         '99999999999999999999999.99'
         )
         )
            attribute_value,
         (      select nvl (max (display_sequence), 0)
                from fl05) + frmattr.display_sequence
            display_rank
         from             fl03_frm_sub_catchment_units fl03
         join
            fl04_risk_cells fl04
         on (fl03.scu_id = fl04.scu_id)
         join
            fl14_risk_cell_attr_values fl14
         on (fl04.cell_id = fl14.cell_id)
         join
            (select 'RIVER_TOT_SCORE' c1,
         'COASTAL_TOT_SCORE' c2,
         'SURFACEWATER_TOT_SCORE' c3,
         fl6.attribute_name,
         fl6.display_name,
         fl6.display_sequence
             from fl06_frm_risk_cell_attributes fl6
             where attribute_name = 'RIVER_SOURCE_PERCENT') frmattr
         on (1 = 1)
         join
            fl06_frm_risk_cell_attributes fl06
         on (fl14.attribute_id = fl06.attribute_id)
         where fl06.attribute_name in (frmattr.c1, frmattr.c2, frmattr.c3)
         group by fl03.scu_id,
         fl03.scu_reference,
         frmattr.attribute_name,
         frmattr.display_name,
         frmattr.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frmattr.attribute_name,
         frmattr.display_name,
         trim (to_char (decode (sum(floodmaster.pkg_frm_util.to_numeric (fl14.
         attribute_value
         )),
            0, 0,
            (sum(decode (fl06.attribute_name,
            frmattr.c2, floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         ),
            0)) / sum(floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         ))) * 100),
         '99999999999999999999999.99'
         )
         )
            attribute_value,
         (      select nvl (max (display_sequence), 0)
                from fl05) + frmattr.display_sequence
            display_rank
         from             fl03_frm_sub_catchment_units fl03
         join
            fl04_risk_cells fl04
         on (fl03.scu_id = fl04.scu_id)
         join
            fl14_risk_cell_attr_values fl14
         on (fl04.cell_id = fl14.cell_id)
         join
            (select 'RIVER_TOT_SCORE' c1,
         'COASTAL_TOT_SCORE' c2,
         'SURFACEWATER_TOT_SCORE' c3,
         fl6.attribute_name,
         fl6.display_name,
         fl6.display_sequence
             from fl06_frm_risk_cell_attributes fl6
             where attribute_name = 'COASTAL_SOURCE_PERCENT') frmattr
         on (1 = 1)
         join
            fl06_frm_risk_cell_attributes fl06
         on (fl14.attribute_id = fl06.attribute_id)
         where fl06.attribute_name in (frmattr.c1, frmattr.c2, frmattr.c3)
         group by fl03.scu_id,
         fl03.scu_reference,
         frmattr.attribute_name,
         frmattr.display_name,
         frmattr.display_sequence
         union all
         select fl03.scu_id,
         fl03.scu_reference,
         frmattr.attribute_name,
         frmattr.display_name,
         trim (to_char (decode (sum(floodmaster.pkg_frm_util.to_numeric (fl14.
         attribute_value
         )),
            0, 0,
            (sum(decode (fl06.attribute_name,
            frmattr.c3, floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         ),
            0)) / sum(floodmaster.pkg_frm_util.to_numeric (fl14.attribute_value
         ))) * 100),
         '99999999999999999999999.99'
         )
         )
            attribute_value,
         (      select nvl (max (display_sequence), 0)
                from fl05) + frmattr.display_sequence
            display_rank
         from             fl03_frm_sub_catchment_units fl03
         join
            fl04_risk_cells fl04
         on (fl03.scu_id = fl04.scu_id)
         join
            fl14_risk_cell_attr_values fl14
         on (fl04.cell_id = fl14.cell_id)
         join
            (select 'RIVER_TOT_SCORE' c1,
         'COASTAL_TOT_SCORE' c2,
         'SURFACEWATER_TOT_SCORE' c3,
         fl6.attribute_name,
         fl6.display_name,
         fl6.display_sequence
             from fl06_frm_risk_cell_attributes fl6
             where attribute_name = 'SURFACEWATER_SOURCE_PERCENT') frmattr
         on (1 = 1)
         join
            fl06_frm_risk_cell_attributes fl06
         on (fl14.attribute_id = fl06.attribute_id)
         where fl06.attribute_name in (frmattr.c1, frmattr.c2, frmattr.c3)
         group by fl03.scu_id,
         fl03.scu_reference,
         frmattr.attribute_name,
         frmattr.display_name,
         frmattr.display_sequence)
   order by scu_id,
            display_rank;
