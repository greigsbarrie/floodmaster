--------------------------------------------------------
--  DDL for View VW_FRM_OBJECTIVES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "FLOODMASTER"."VW_FRM_OBJECTIVES" ("RBD_CODE", "RBD_NAME", "CALENDAR_ID", "CALENDAR", "OBJECTIVE_ID", "LPD_ID", "LPD_NAME", "PVA_ID", "PVA_REFERENCE", "PVA_NAME", "LOCAL_AUTHORITIES", "SOURCE", "LOCATION_NOTE", "OBJECTIVE_CATEGORY_ID", "OBJECTIVE_CATEGORY", "OBJECTIVE_DESC", "TARGET_AREA_EXIST", "OBJECTIVE_TYPE_ID", "OBJECTIVE_TYPE", "OBJECTIVE_REF", "LINKED_OBJECTIVES", "OBJECTIVE_ID_DISPLAY", "OBJECTIVE_DESC_DISPLAY", "OBJECTIVE_STATE_ID", "OBJECTIVE_STATE", "COVERAGE_TYPE_ID", "COVERAGE_TYPE") AS 
  SELECT nvl(fl02.rbd_code,fl02_2.rbd_code) RBD_CODE
, WF39.name RBD_NAME
, FL94.CALENDAR_ID
, FL79.CALENDAR
, FL94.OBJECTIVE_ID
, FL94.LPD_ID
, NVL2(FL94.LPD_ID,FL02_2.LPD_NAME,NULL) LPD_NAME
, FL94.PVA_ID
, NVL2(FL94.PVA_ID,FL01.PVA_REFERENCE,NULL) PVA_REFERENCE
, NVL2(FL94.PVA_ID,FL01.PVA_NAME,NULL) PVA_NAME
, LAS_CSV.LAS LOCAL_AUTHORITIES
, SOURCES_CSV.SOURCE
, FL94.LOCATION_NOTE
, FL94.OBJECTIVE_CATEGORY_ID
, FL84.OBJECTIVE_CATEGORY
, FL94.OBJECTIVE_DESC
, NVL2(FRM_OBJ_TARGET_AREAS.OBJECTIVE_ID, 'Yes', 'No') TARGET_AREA_EXIST
, FL94.OBJECTIVE_TYPE_ID
, FL81.OBJECTIVE_TYPE
, FL102.OBJECTIVE_REF
, LO_CSV.LINKED_OBJECTIVES
, LOD_CSV.OBJECTIVE_ID_DISPLAY
, FL94.OBJECTIVE_DESC_DISP OBJECTIVE_DESC_DISPLAY
, FL94.OBJECTIVE_STATE_ID
, FL83.OBJECTIVE_STATE
, FL94.COVERAGE_TYPE_ID
, FL80.COVERAGE_TYPE
FROM FL94,
     FL02,
     FL01,
     WF39,
     FL79,
     FL102,
     FL02 FL02_2,
     FL84,
     FL81,
     FL83,
     FL80,
     FRM_OBJ_TARGET_AREAS@G01L,
     (SELECT FL101.OBJECTIVE_ID,
       LISTAGG(GE70.NAME, ', ') WITHIN GROUP (ORDER BY FL101.OBJECTIVE_ID) LAS
        FROM FL101, GE70
        WHERE GE70.LA_ID=FL101.LA_ID
        GROUP BY FL101.OBJECTIVE_ID
        ORDER BY FL101.OBJECTIVE_ID) LAS_CSV,
     (SELECT FL95.OBJECTIVE_ID,
       LISTAGG(FL50.SOURCE_DISP, ', ') WITHIN GROUP (ORDER BY FL95.OBJECTIVE_ID) SOURCE
        FROM FL50, FL95
        WHERE FL50.SOURCE_CODE=FL95.SOURCE_CODE
        GROUP BY FL95.OBJECTIVE_ID
        ORDER BY FL95.OBJECTIVE_ID) SOURCES_CSV,
      (SELECT
          objective_id,
          (SELECT LISTAGG(objective_ref,',') WITHIN GROUP (ORDER BY fl102.objective_ref)
            FROM fl102
            WHERE fl102.objective_id in (SELECT linked_objective
                                         FROM fl96
                                         WHERE fl96.objective_id=fl94.objective_id
                                         AND fl96.link_type_id = 2)) LINKED_OBJECTIVES
       FROM FL94_OBJECTIVES fl94) LO_CSV,
      (SELECT
          objective_id,
          (SELECT LISTAGG(objective_ref,',') WITHIN GROUP (ORDER BY fl102.objective_ref)
            FROM fl102
            WHERE fl102.objective_id in (SELECT linked_objective
                                         FROM fl96
                                         WHERE fl96.objective_id=fl94.objective_id
                                         AND fl96.link_type_id = 3)) OBJECTIVE_ID_DISPLAY
       FROM FL94_OBJECTIVES fl94) LOD_CSV
WHERE FL94.OBJECTIVE_ID = FL102.OBJECTIVE_ID
AND fl94.pva_id=fl01.pva_id(+)
AND fl01.lpd_id=fl02.lpd_id(+)
AND fl94.lpd_id=fl02_2.lpd_id(+)
AND nvl(fl02.rbd_code,fl02_2.rbd_code) = WF39.rbd_code
AND FL94.CALENDAR_ID = FL79.CALENDAR_ID
AND FL94.OBJECTIVE_ID = LAS_CSV.OBJECTIVE_ID(+)
AND FL94.OBJECTIVE_ID = SOURCES_CSV.OBJECTIVE_ID(+)
AND FL94.OBJECTIVE_CATEGORY_ID = FL84.OBJECTIVE_CATEGORY_ID
AND FL94.OBJECTIVE_TYPE_ID = FL81.OBJECTIVE_TYPE_ID
AND FL94.OBJECTIVE_ID = FL102.OBJECTIVE_ID
AND FL94.OBJECTIVE_ID = LO_CSV.OBJECTIVE_ID(+)
AND FL94.OBJECTIVE_ID = LOD_CSV.OBJECTIVE_ID(+)
AND FL94.OBJECTIVE_STATE_ID=FL83.OBJECTIVE_STATE_ID
AND FL94.COVERAGE_TYPE_ID=FL80.COVERAGE_TYPE_ID(+)
AND FL94.OBJECTIVE_ID=FRM_OBJ_TARGET_AREAS.OBJECTIVE_ID(+)
ORDER BY FL94.OBJECTIVE_ID;
