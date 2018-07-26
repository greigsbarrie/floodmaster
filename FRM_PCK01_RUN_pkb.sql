--------------------------------------------------------
--  DDL for Package Body FRM_PCK01_RUN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "FLOODMASTER"."FRM_PCK01_RUN" IS
   /******************************************************************************
      NAME:       FRM_PCK01_RUN
      TYPE:       Package Body
      PURPOSE:    to encapsulate procedures and functions that create FRM AB import
                  Runs.

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        28/05/2013   Joel Cooney     Created this package.
   ******************************************************************************/

   /****
   *
   * Private Constants
   *
   ****/

   cn_run_status_new fl997_frm_ab_run_status.run_status_id%Type := 1;
   cn_run_status_inprogress fl997_frm_ab_run_status.run_status_id%Type := 2;
   cn_run_status_complete fl997_frm_ab_run_status.run_status_id%Type := 3;
   cn_run_status_error fl997_frm_ab_run_status.run_status_id%Type := 999;

   /****
   *
   * Private Global Variables
   *
   ****/

   /* holds the default current user */
   g_user_id ut15_users.user_id%Type;

   /****
   *
   * Functions + Procedures
   *
   ****/

   /****
   *
   * Private Functions
   *
   ****/

   /****
   *
   * Name: f_get_user_id
   * Type: function
   * Purpose: Private function to return User ID given an APEX username
   * Parameters: p_username - IN - textual APEX username
   * Returns: the related user ID
   *
   ****/
   Function f_get_user_id (p_username In ut15_users.username%Type)
      Return ut15_users.user_id%Type Is
      l_retval ut15_users.user_id%Type;
   Begin
      Select usr.user_id
      Into l_retval
      From ut15_users usr
      Where upper(usr.username) = upper(p_username);

      Return l_retval;
   Exception
      When No_data_found Then
         Return Null;
   End f_get_user_id;

   /****
   *
   * Constant Functions
   *
   ****/

   Function fc_run_status_new
      Return Number
      Deterministic Is
   Begin
      Return cn_run_status_new;
   End fc_run_status_new;

   Function fc_run_status_inprogress
      Return Number
      Deterministic Is
   Begin
      Return cn_run_status_inprogress;
   End fc_run_status_inprogress;

   Function fc_run_status_complete
      Return Number
      Deterministic Is
   Begin
      Return cn_run_status_complete;
   End fc_run_status_complete;

   Function fc_run_status_error
      Return Number
      Deterministic Is
   Begin
      Return cn_run_status_error;
   End fc_run_status_error;

   /****
   *
   * Name: f_create_run
   * Type: Function
   * Purpose: Creates a new FRM AB import Run.
   *
   * Returns: A New Run ID
   *
   ****/
   Function f_create_run
      Return Number Is
      l_retval Number;
      pragma autonomous_transaction;

   Begin
      Insert Into fl998_frm_ab_runs rn (
                                           rn.run_status, rn.run_user_id
     )
      Values (
                 cn_run_status_new, g_user_id
             )
      Returning rn.run_id Into l_retval;

      commit;

      Return l_retval;


   End f_create_run;

   /****
   *
   * Name: p_create_run
   * Type: Procedure
   * Purpose: Sets the status of a Run
   *
   *
   ****/
   Procedure p_set_run_status (p_run_id In Number, p_run_status In Number) Is

      pragma autonomous_transaction;

   Begin


      Update fl998_frm_ab_runs rn
      Set rn.run_status = p_run_status
      Where rn.run_id = p_run_id;

      commit;

   End p_set_run_status;
Begin
   g_user_id := f_get_user_id (Nvl (v ('APP_USER'), User));
End frm_pck01_run;

/
