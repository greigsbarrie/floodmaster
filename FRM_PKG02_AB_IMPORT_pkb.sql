--------------------------------------------------------
--  DDL for Package Body FRM_PKG02_AB_IMPORT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "FLOODMASTER"."FRM_PKG02_AB_IMPORT" IS
   /******************************************************************************
      NAME:       FRM_PKG02_AB_IMPORT
      Type:       Package Body
      PURPOSE:    To encapsulate functions and procedures relating to
                  the import and updating of FRM Annualized Baseline Data

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        23/05/2013   Joel Cooney     Created this package Body
      1.1        27/05/2013   Joel Cooney     Amended package name
                                              OLD: Pkg_frm_ab_import
                                              NEW: FRM_PKG02_AB_IMPORT
      1.2        07/11/2013   Joel Cooney     Removed references to table FL72
                                              - deleted procedure p_load_props_risk
                                              - amended function ft_import_minimal_data
                                              - amended procedure p_wipe_down_old_data
   ******************************************************************************/

   no_such_table              EXCEPTION;
   PRAGMA EXCEPTION_INIT (no_such_table,                -942);
   invalid_column_name        EXCEPTION;
   PRAGMA EXCEPTION_INIT (invalid_column_name,          -904);

   Function ft_ind_values (p_src_type In Number Default Null )
      Return tb_indvals
      Pipelined Is
      /* cursor defines valid combinations of import fields, source types
       * receptors and ind val IDs
       */
      Cursor c_valid_combs Is
         Select fl67.load_table_column_name
               ,fl61.load_table_name
               ,fl67.fr_ind_id
               ,fl67.receptor_id
               ,fl67.source_ab_type_id
         From fl67_ab_valid_combinations fl67, fl61_source_ab_types fl61
         Where fl61.source_ab_type_id = fl67.source_ab_type_id
           And fl67.single_site_type_id Is Null
           And fl67.source_ab_type_id = Nvl (p_src_type, fl67.source_ab_type_id);

      v_sql Varchar2 (32767);
      cv_data sys_refcursor;
      rec_data rt_indval;
   Begin
      For r_valid_combs In c_valid_combs Loop
         /* looping over dataset from import data (encapsulated in a view)
          * one load column at a time - effectively de-pivoting it.
          */
         v_sql :=
            q'^select vimp.scu_id
                     ,:src_id source_ab_type_id
                     ,(select fl62.scenario_id
                         from fl62_scenarios fl62
                        where UPPER(fl62.scenario_description) = UPPER(trim(nvl(vimp.scenario_description,'Annualised Assessment')))
                      ) scenario_id
                     ,:recpid receptor_id
                     ,:frind fr_ind_id
                     ,^'
            || r_valid_combs.load_table_column_name
            || ' value
                     ,vimp.date_derived
                from '
            || r_valid_combs.load_table_name
            || ' Vimp';

         begin
            Open cv_data For v_sql Using r_valid_combs.source_ab_type_id, r_valid_combs.receptor_id, r_valid_combs.fr_ind_id;

            Loop
               Fetch cv_data Into rec_data;
               Exit When cv_data%Notfound;
               Pipe Row (rec_data);
            End Loop;
         exception
         when no_such_table then
            null; -- indicates load table is missing or doesn't exist. Ignore
         when invalid_column_name then
            null; -- indicate load table column is missing or doesn't exist. Ignore
         end;
      End Loop;

      Return;
   End ft_ind_values;

   Function ft_single_site_counts (p_src_type In Number Default Null )
      Return tb_sgl_ste_cnts
      Pipelined Is
      /* cursor defines valid combinations of import fields, source types
       * receptors and single site ids
       */
      Cursor c_valid_combs Is
         Select fl67.load_table_column_name
               ,fl61.load_table_name
               ,fl67.single_site_type_id
               ,fl67.receptor_id
               ,fl67.source_ab_type_id
         From fl67_ab_valid_combinations fl67, fl61_source_ab_types fl61
         Where fl61.source_ab_type_id = fl67.source_ab_type_id
           And fl67.single_site_type_id Is Not Null
           And fl67.source_ab_type_id = Nvl (p_src_type, fl67.source_ab_type_id);

      v_sql Varchar2 (32767);
      cv_data sys_refcursor;
      rec_data rt_sgl_ste_cnt;
   Begin
      For r_valid_combs In c_valid_combs Loop
         /* looping over each import load table
          * one load column at a time - effectively de-pivoting it.
          */
         v_sql :=
            q'^select vimp.scu_id
                     ,:src_id source_ab_type_id
                     ,(select fl62.scenario_id
                         from fl62_scenarios fl62
                        where UPPER(fl62.scenario_description) = UPPER(trim(nvl(vimp.scenario_description,'Annualised Assessment')))
                      ) scenario_id
                     ,:recpid receptor_id
                     ,:sngsite single_site_type_id
                     ,^'
            || r_valid_combs.load_table_column_name
            || ' fl71_count
                     , vimp.date_derived
                from '
            || r_valid_combs.load_table_name
            || ' Vimp';
         begin
             Open cv_data For v_sql Using r_valid_combs.source_ab_type_id, r_valid_combs.receptor_id, r_valid_combs.single_site_type_id;


             Loop
                Fetch cv_data Into rec_data;

                Exit When cv_data%Notfound;
                Pipe Row (rec_data);
             End Loop;
         exception
         when no_such_table then
            null; -- indicates load table is missing or doesn't exist. Ignore
         when invalid_column_name then
            null; -- indicate load table column is missing or doesn't exist. Ignore
         end;
      End Loop;

      Return;
   End ft_single_site_counts;

   Function ft_import_minimal_data (p_src_type In Number Default Null )
      Return tb_import_mins
      Pipelined Is
      /* import load tables from which data will be extracted */
      Cursor c_src Is
         Select fl61.load_table_name, fl61.source_ab_type_id
         From fl61_source_ab_types fl61
         Where fl61.source_ab_type_id =
                  Nvl (p_src_type, fl61.source_ab_type_id);

      v_sql Varchar2 (32767);
      cv_data sys_refcursor;
      rec_data rt_import_min;
   Begin
      For r_src In c_src Loop
         /* query pulling 'minimal' dataset from load table(s) */
         v_sql :=
            q'^select scu_id
                          ,:src_type source_ab_type_id
                          ,(select scenario_id
                              from fl62_scenarios fl62
                             where upper(fl62.scenario_description) = UPPER(trim(nvl(vimp.scenario_description,'Annualised Assessment')))
                           ) scenario_id
                          ,date_derived
                     from ^'
            || r_src.load_table_name
            || ' vimp';
         begin
             Open cv_data For v_sql Using r_src.source_ab_type_id;

             Loop
                Fetch cv_data Into rec_data;
                Exit When cv_data%Notfound;
                Pipe Row (rec_data);
             End Loop;
         exception
         when no_such_table then
            null; -- indicates load table is missing or doesn't exist. Ignore
         when invalid_column_name then
            null; -- indicate load table column is missing or doesn't exist. Ignore
         end;
      End Loop;
   End ft_import_minimal_data;

   Function ft_import_preview (p_src_type in number default null)
        Return tb_import_preview
        Pipelined Is
      /* import load tables from which data will be extracted */
      Cursor c_src Is
         Select fl61.load_table_name, fl61.source_ab_type_id
         From fl61_source_ab_types fl61
         Where fl61.source_ab_type_id =
                  Nvl (p_src_type, fl61.source_ab_type_id);

      v_sql Varchar2 (32767);
      cv_data sys_refcursor;
      rec_data rt_import_preview;
   Begin
      For r_src In c_src Loop
         /* query pulling 'preview' dataset from load table(s) */
         v_sql :=
            'select scu_id
                          ,:src_type source_ab_type_id
                          ,scenario_description
                     from '
            || r_src.load_table_name
            || ' vimp';

         begin
            Open cv_data For v_sql Using r_src.source_ab_type_id;

            Loop
               Fetch cv_data Into rec_data;
               Exit When cv_data%Notfound;
               Pipe Row (rec_data);
            End Loop;
         exception
         when no_such_table then
            null; -- indicates load table is missing or doesn't exist. Ignore
         when invalid_column_name then
            null; -- indicate load table column is missing or doesn't exist. Ignore
         end;

      End Loop;
   end ft_import_preview;

   Procedure p_wipe_down_old_data (p_run_id in number, p_src_type In Number Default Null ) Is
   Begin
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_wipe_down_old_data', 'input p_src_type = ' || p_src_type,p_run_id);

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_wipe_down_old_data', 'FL70 Individual Values - pre-deletion',p_run_id);

      /* removes existing data from FL70 by source type, SCU and scenario */
      Delete /*+ USE_HASH(fl70) */ From fl70_ab_fr_ind_values fl70
      Where Exists (Select  1
                    From table (ft_import_minimal_data (p_src_type)) vimp
                    Where vimp.source_ab_type_id = fl70.source_ab_type_id
                      And fl70.scenario_id = vimp.scenario_id
                      And fl70.scu_id = vimp.scu_id);

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_wipe_down_old_data', 'FL70 Individual Values - rows deleted = ' || Nvl (sql%Rowcount, 0),p_run_id, 50);

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_wipe_down_old_data', 'FL71 Single Sites Count - pre-deletion',p_run_id);

      /* removes existing data from FL71 by source type, SCU and scenario */
      Delete /*+ USE_HASH(fl71) */ From fl71_ab_single_site_counts fl71
      Where Exists (Select 1
                    From table (ft_import_minimal_data (p_src_type)) vimp
                    Where fl71.source_ab_type_id = vimp.source_ab_type_id
                      And fl71.scenario_id = vimp.scenario_id
                      And fl71.scu_id = vimp.scu_id);

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_wipe_down_old_data', 'FL71 Single Sites Count - rows deleted = ' || Nvl (sql%Rowcount, 0),p_run_id, 50);


   Exception
      When Others Then
         ut_pck07.p_handle_error (
            p_application => 'FRM Annualized Baseline'
           ,p_calling_package => 'FRM_PKG02_AB_IMPORT'
           ,p_error_location => 'p_wipe_down_old_data'
           ,p_error_log_type => 'REPORT AND STOP'
           ,p_error_code => Sqlcode
           ,p_error_data => dbms_utility.FORMAT_ERROR_BACKTRACE ||' - ' ||dbms_utility.FORMAT_ERROR_STACK
           ,p_error_table => Null
           ,p_error_key_field => Null
           ,p_error_key_value => Null
         );
   End p_wipe_down_old_data;

   Procedure p_load_ind_vals (p_run_id in number, p_src_type In Number Default Null ) Is
   Begin
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_load_ind_vals', 'input p_src_type = ' || p_src_type,p_run_id);

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_load_ind_vals', 'FL70 Individual Values - pre-insertion.',p_run_id);

      /* inserting individual values from load table(s) */
      Insert Into fl70_ab_fr_ind_values fl70 (
                                                 fl70.scu_id
                                                ,fl70.source_ab_type_id
                                                ,fl70.scenario_id
                                                ,fl70.receptor_id
                                                ,fl70.fr_ind_id
                                                ,fl70.Value
                                                ,fl70.date_derived
     )
         Select vimp.scu_id
               ,vimp.source_ab_type_id
               ,vimp.scenario_id
               ,vimp.receptor_id
               ,vimp.fr_ind_id
               ,vimp.Value
               ,vimp.date_derived
         From table (ft_ind_values (p_src_type)) vimp
        where vimp.value is not null;

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_load_ind_vals', 'FL70 Individual Values - rows inserted = ' || Nvl (sql%Rowcount, 0),p_run_id, 50);
   Exception
      When Others Then
         ut_pck07.p_handle_error (
            p_application => 'FRM Annualized Baseline'
           ,p_calling_package => 'FRM_PKG02_AB_IMPORT'
           ,p_error_location => 'p_load_ind_vals'
           ,p_error_log_type => 'REPORT AND STOP'
           ,p_error_code => Sqlcode
           ,p_error_data => dbms_utility.FORMAT_ERROR_BACKTRACE ||' - ' ||dbms_utility.FORMAT_ERROR_STACK
           ,p_error_table => Null
           ,p_error_key_field => Null
           ,p_error_key_value => Null
         );
   End p_load_ind_vals;

   Procedure p_load_single_sites (p_run_id in number, p_src_type In Number Default Null ) Is
   Begin
      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_load_single_sites', 'input p_src_type = ' ||p_src_type,p_run_id);

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_load_single_sites', 'FL71 - pre-insertion.',p_run_id);

      /* inserting single site data from load table(s) */
      Insert Into fl71_ab_single_site_counts fl71 (
                                                      fl71.scu_id
                                                     ,fl71.source_ab_type_id
                                                     ,fl71.scenario_id
                                                     ,fl71.receptor_id
                                                     ,fl71.single_site_type_id
                                                     ,fl71.fl71_count
                                                     ,fl71.date_derived
     )
         Select vimp.scu_id
               ,vimp.source_ab_type_id
               ,vimp.scenario_id
               ,vimp.receptor_id
               ,vimp.single_site_type_id
               ,vimp.fl71_count
               ,vimp.date_derived
          From table (ft_single_site_counts (p_src_type)) vimp
         where vimp.fl71_count is not null;

      frm_pck00_log.p_log_entry ('frm_pkg02_ab_import.p_load_single_sites', 'FL71 - rows inserted = ' || Nvl (sql%Rowcount, 0),p_run_id, 50);
   Exception
      When Others Then
         ut_pck07.p_handle_error (
            p_application => 'FRM Annualized Baseline'
           ,p_calling_package => 'FRM_PKG02_AB_IMPORT'
           ,p_error_location => 'p_load_single_sites'
           ,p_error_log_type => 'REPORT AND STOP'
           ,p_error_code => Sqlcode
           ,p_error_data => dbms_utility.FORMAT_ERROR_BACKTRACE ||' - ' ||dbms_utility.FORMAT_ERROR_STACK
           ,p_error_table => Null
           ,p_error_key_field => Null
           ,p_error_key_value => Null
         );
   End p_load_single_sites;
End frm_pkg02_ab_import;

/
