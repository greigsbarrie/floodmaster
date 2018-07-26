--------------------------------------------------------
--  DDL for View VW_FLOOD_EVENTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FLOOD_EVENTS" ("EVENT_ID", "EVENT_REF", "DISPLAY_LEVEL", "ORGANISATION", "EASTING", "NORTHING", "EXTENT_AVAIL_YN", "YEAR_OF_EVENT", "MONTH_OF_EVENT", "DAY_OF_EVENT", "DATE_OF_EVENT", "TIME_OF_EVENT", "DURATION_HRS", "AREA_KM2", "GENERAL_COMMENTS", "SCORE_OVERALL", "SCORE_NOTES", "SCORE_HH_PEOPLE", "SCORE_HH_PROPERTY", "SCORE_ECON_BUSINESS", "SCORE_ECON_TRANSPORT", "SCORE_HH_COMMUNITY", "SCORE_ECON_RURAL", "SCORE_ENV", "SCORE_CH", "SCORE_GENERAL", "FATALITIES_NUM", "FATALITIES_DESC", "LOCAL_AUTHORITY", "NAME_OF_LOCATION", "PART_OF_MERGED_EVENT_YN", "MERGED_EVENT_REF", "RBD_CODE", "GRID_REF_ASSIGNED", "RECORDED_BY", "DATE_RECORDED", "DATA_SOURCE_PRIMARY", "DATA_SOURCE_DETAIL", "DATA_SOURCE_LOCATION", "DATA_SOURCE_TYPE", "DATA_SOURCE_OTHER", "DATA_SOURCE_RELIABILITY", "PHOTOS_AVAIL_YN", "LEVEL_DURING_VALUE_M", "LEVEL_DURING_DETS", "RETURN_PERIOD", "RETURN_PERIOD_COMMENT", "RECURRENCE", "RECURRENCE_COMMENT") AS 
  select event_id,
          event_ref,
          case
             when upper (part_of_merged_event_yn) = 'Y' then 0
             else score_overall
          end
             display_level,
          organisation,
          easting,
          northing,
          substr (extent_avail_yn,
                  1,
                  1
          )
             extent_avail_yn,
          year_of_event,
          month_of_event,
          day_of_event,
          substr (pkg_frm_util.createdate (year_of_event,
                                           month_of_event,
                                           day_of_event
                  ),
                  1,
                  30
          )
             date_of_event,
          time_of_event,
          duration_hrs,
          area_km2,
          general_comments,
          score_overall,
          substr (score_notes,
                  1,
                  240
          )
             score_notes,
          score_hh_people,
          score_hh_property,
          score_econ_business,
          score_econ_transport,
          score_hh_community,
          score_econ_rural,
          score_env,
          score_ch,
          score_general,
          fatalities_num,
          substr (fatalities_desc,
                  1,
                  240
          )
             fatalities_desc,
          ge70.name local_authority,
          name_of_location,
          part_of_merged_event_yn,
          merged_event_ref,
          fl30.rbd_code,
          grid_ref_assigned,
          recorded_by,
          date_recorded,
          substr (data_source_primary,
                  1,
                  240
          )
             data_source_primary,
          substr (data_source_detail,
                  1,
                  240
          )
             data_source_detail,
          substr (data_source_location,
                  1,
                  300
          )
             data_source_location,
          substr (data_source_type,
                  1,
                  240
          )
             data_source_type,
          substr (data_source_other,
                  1,
                  300
          )
             data_source_other,
          substr (data_source_reliability,
                  1,
                  240
          )
             data_source_reliability,
          substr (photos_avail_yn,
                  1,
                  1
          )
             photos_avail_yn,
          level_during_value_m,
          substr (level_during_dets,
                  1,
                  240
          )
             level_during_dets,
          return_period,
          substr (return_period_comment,
                  1,
                  240
          )
             return_period_comment,
          recurrence,
          substr (recurrence_comment,
                  1,
                  240
          )
             recurrence_comment
   from       fl30
           left join
              ge70
           on (fl30.la_id = ge70.la_id)
        left join
           wf39
        on (fl30.rbd_code = wf39.rbd_code);
