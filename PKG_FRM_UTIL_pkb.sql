--------------------------------------------------------
--  DDL for Package Body PKG_FRM_UTIL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "FLOODMASTER"."PKG_FRM_UTIL" IS

FUNCTION TO_NUMERIC
 (PNUM IN VARCHAR2
 ,PFMT IN VARCHAR2 := NULL
 )
 RETURN NUMBER
 IS
BEGIN
  if pfmt is not null then
  RETURN TO_NUMBER(PNUM,PFMT);
  else
  return to_number(pnum);
  end if;
  exception
  when others then
   return 0;
END TO_NUMERIC;
FUNCTION CREATEDATE
 (PYEAR IN VARCHAR2
 ,PMONTH IN VARCHAR2
 ,PDAY IN VARCHAR2
 )
 RETURN VARCHAR2
 IS

V_MONTH VARCHAR2(30);
v_date varchar2(30);
BEGIN

IF PMONTH IS NOT NULL THEN
    IF TO_NUMERIC(PMONTH) BETWEEN 1 AND 12 THEN
       V_MONTH:=TO_CHAR(TO_DATE(PMONTH||'-2001','MM-YYYY'),'Month');
    END IF;
END IF;


v_date:=PDAY||'-'||V_MONTH||'-'||PYEAR;

V_DATE:=TRIM('-' FROM V_DATE);

RETURN V_DATE;

END CREATEDATE;
END;

/
