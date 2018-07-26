--------------------------------------------------------
--  DDL for Package Body FRM_PCK03_MAIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "FLOODMASTER"."FRM_PCK03_MAIN" IS
/******************************************************************************
  NAME:       FRM_PCK03_MAIN
  TYPE:       Package body
  PURPOSE:    to encapsulate procedures and functions that initiate FM AB
              processes

  REVISIONS:
  Ver        Date        Author           Description
  ---------  ----------  ---------------  ------------------------------------
  1.0        27/05/2013   Joel Cooney     Created this package.
  1.1.       07/11/2013   Joel Cooney     Removed reference to FL72
                                          - deleted call to p_load_props_risk
******************************************************************************/

   g_run_id fl998_frm_ab_runs.run_id%type;

   Procedure p_ab_import (p_src_type In Number default null) Is
   Begin

      g_run_id := FRM_PCK01_RUN.F_CREATE_RUN;
      frm_pck01_run.p_set_run_status(g_run_id, frm_pck01_run.fc_run_status_inprogress);
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_ab_import','run_id = ' || g_run_id);
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_ab_import', 'input p_src_type = ' || p_src_type, g_run_id);
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_ab_import', 'Wiping Down obsolete data', g_run_id, 10);
      frm_pkg02_ab_import.p_wipe_down_old_data (g_run_id, p_src_type);
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_ab_import', 'Loading individual values', g_run_id, 10);
      frm_pkg02_ab_import.p_load_ind_vals (g_run_id, p_src_type);
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_ab_import', 'Loading Single Sites', g_run_id, 10);
      frm_pkg02_ab_import.p_load_single_sites (g_run_id, p_src_type);
      frm_pck01_run.p_set_run_status(g_run_id, frm_pck01_run.fc_run_status_complete);

   exception
   when others then
      dbms_output.put_line(SQLERRM||'-'||SQLCODE);
      dbms_output.put_line(dbms_utility.FORMAT_ERROR_STACK);
      frm_pck01_run.p_set_run_status(g_run_id, frm_pck01_run.fc_run_status_error);

   End;
End frm_pck03_main;

/
