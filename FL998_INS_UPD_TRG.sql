--------------------------------------------------------
--  DDL for Trigger FL998_INS_UPD_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL998_INS_UPD_TRG" 
 BEFORE INSERT OR UPDATE OF RUN_STATUS
 ON FL998_FRM_AB_RUNS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE

   /******************************************************************************
      NAME: fl998_ins_upd_trg
      PURPOSE: Inserting and Updating trigger

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        28/05/2013  Joel Cooney      1. Created this trigger.

   ******************************************************************************/

   l_runid fl998_frm_ab_runs.run_id%Type := 0;
Begin

   If Inserting Then
      Select fl998_seq.Nextval Into l_runid From Dual;
      :new.run_id := l_runid;
   Elsif Updating Then
      If :new.run_status In
               (frm_pck01_run.fc_run_status_complete
               ,frm_pck01_run.fc_run_status_error) Then
         :new.end_date := Sysdate;
      End If;
   End If;

Exception
   When Others Then
      -- Consider logging the error and then re-raise
      Raise;
End;

/
ALTER TRIGGER "FLOODMASTER"."FL998_INS_UPD_TRG" ENABLE;
