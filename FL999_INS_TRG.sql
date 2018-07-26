--------------------------------------------------------
--  DDL for Trigger FL999_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL999_INS_TRG" 
 BEFORE INSERT
 ON FL999_FRM_LOG
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE

/******************************************************************************
  NAME:       FL999_INS_TRG
  PURPOSE:    Insert trigger for creating PK ID for logging table

  REVISIONS:
  Ver        Date        Author           Description
  ---------  ----------  ---------------  ------------------------------------
  1.0        28/05/2013  Joel Cooney      1. Created this trigger.

  NOTES:

     Table Name:      FL999_FRM_LOG
******************************************************************************/

   l_new_seq Number;
Begin

   l_new_seq := 0;

   Select fl999_seq.Nextval Into l_new_seq From Dual;
   :new.log_id := l_new_seq;

End fl999_ins_trg;

/
ALTER TRIGGER "FLOODMASTER"."FL999_INS_TRG" ENABLE;
