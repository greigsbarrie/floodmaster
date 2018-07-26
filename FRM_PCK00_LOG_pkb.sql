--------------------------------------------------------
--  DDL for Package Body FRM_PCK00_LOG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "FLOODMASTER"."FRM_PCK00_LOG" IS
   /******************************************************************************
     NAME:       FRM_PCK00_LOG
     TYPE:       Package Specification
     PURPOSE:    Utility package to collect logging data related to FRM

     REVISIONS:
     Ver        Date        Author           Description
     ---------  ----------  ---------------  ------------------------------------
     1.0        27/05/2013   Joel Cooney     Created this package.
   ******************************************************************************/

   /* private globabl variable to hold the current user */
   g_user_id ut15_users.user_id%Type;

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
      Where usr.username = p_username;

      Return l_retval;
   Exception
      When No_data_found Then
         Return Null;
   End f_get_user_id;


   Procedure p_log_entry (
      p_log_source In Varchar2
     ,p_log_value In Varchar2
     ,p_run_id    In Number default null
     ,p_log_level In Number Default 9999
   ) Is
      Pragma Autonomous_transaction;
   Begin
      Insert Into fl999_frm_log flog (
                                         flog.created_source
                                        ,flog.log_value
                                        ,flog.log_level
                                        ,flog.log_user
                                        ,flog.run_id
     )
      Values (
                 p_log_source
                ,Substr (p_log_value, 1, 4000) /* limit entry to 4000 chars */
                ,p_log_level
                ,g_user_id
                ,p_run_id
             );
      commit;

   End p_log_entry;
Begin
   /* code runs when package is initialized */
   g_user_id := f_get_user_id (Nvl (v ('APP_USER'), User));
   dbms_output.put_line('g_user_id:'|| g_user_id||';');
End frm_pck00_log;

/
