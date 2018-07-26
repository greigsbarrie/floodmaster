--------------------------------------------------------
--  DDL for Package FRM_PKG02_AB_IMPORT
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "FLOODMASTER"."FRM_PKG02_AB_IMPORT" IS
/******************************************************************************
   NAME:       Pkg_frm_ab_import
   TYPE:       Package Specification
   PURPOSE:    To encapsulate functions and procedures relating to
               the import and updating of FRM Annualized Baseline Data

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        23/05/2013   Joel Cooney     Created this package.
   1.1        27/05/2013   Joel Cooney     Amended package name
                                           OLD: Pkg_frm_ab_import
                                           NEW: FRM_PKG02_AB_IMPORT
   1.2        29/05/2013   Joel Cooney     Added Run ID parameter to the
                                           following procedures:
                                            - p_wipe_down_old_data
                                            - p_load_ind_vals
                                            - p_load_single_sites
                                            - p_load_props_risk
   1.3        06/06/2013   Joel Cooney    Added function: ft_import_preview
   1.4        07/11/2013   Joel Cooney    Removed all references to FL72 table:
                                          - deleted p_load_props_risk
                                          - amended type rt_import_min
******************************************************************************/

/****
*
* Types
*
****/

    /* record type to encapsulate and pivot import load data
       for insertion into FL70 table */
    Type Rt_indval Is Record (
        Scu_id				  Fl70_ab_fr_ind_values.Scu_id%Type
        ,Source_ab_type_id    Fl70_ab_fr_ind_values.Source_ab_type_id%Type
        ,Scenario_id 		  Fl70_ab_fr_ind_values.Scenario_id%Type
        ,Receptor_id 		  Fl70_ab_fr_ind_values.Receptor_id%Type
        ,Fr_ind_id			  Fl70_ab_fr_ind_values.Fr_ind_id%Type
        ,Value 				  Fl70_ab_fr_ind_values.Value%Type
        ,Date_derived		  Fl70_ab_fr_ind_values.Date_derived%Type
    );

	Type Tb_indvals Is Table Of Rt_indval;

    /* record type to encapsulate and pivot import load data
       for insertion into FL71 table */
	Type Rt_sgl_ste_cnt Is Record (
        Scu_id 					Fl71_ab_single_site_counts.Scu_id%Type
        ,Source_ab_type_id		Fl71_ab_single_site_counts.Source_ab_type_id%Type
        ,Scenario_id			Fl71_ab_single_site_counts.Scenario_id%Type
        ,Receptor_id			Fl71_ab_single_site_counts.Receptor_id%Type
        ,Single_site_type_id	Fl71_ab_single_site_counts.Single_site_type_id%Type
        ,Fl71_count				Fl71_ab_single_site_counts.Fl71_count%Type
        ,Date_derived 			Fl71_ab_single_site_counts.Date_derived%Type
    );

	Type Tb_sgl_ste_cnts Is Table Of Rt_sgl_ste_cnt;

    /* record type to encapsulate and pivot import load data
       for deletion and insertion into FL72 table */
    Type rt_import_min is record (
       scu_id                number
       ,source_ab_type_id    number
       ,scenario_id          number
       ,date_derived         date
    );

    type tb_import_mins is table of rt_import_min;

    /* record type to encapsulate and pivot import load data
       for preview */
    Type rt_import_preview is record (
       scu_id                number
       ,source_ab_type_id    number
       ,scenario_desc        varchar2(32767)
    );

    type tb_import_preview is table of rt_import_preview;

/****
*
* Functions + Procedures
*
****/

   /****
   *
   * Name: Ft_ind_values
   * Type: Function
   * Purpose: Pipelined streaming table function to convert imported data in
   *          G01L into appropriate IND Values, formatted for insertion into
   *          C01L e.g.
   *
   *          SELECT t.* FROM TABLE(Pkg_frm_ab_import.Ft_ind_values) t
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   * Returns: a PL/SQL table (pipelined) containing Ind Value data
   *
   ****/
	Function Ft_ind_values (p_src_type in number default null)
		Return Tb_indvals
		Pipelined;

   /****
   *
   * Name: Ft_single_site_counts
   * Type: Function
   * Purpose: Pipelined streaming table function to convert imported data in
   *          G01L into appropriate single site counts, formatted for insertion
   *          into C01L e.g.
   *
   *          SELECT t.* FROM TABLE(Pkg_frm_ab_import.Ft_single_site_counts) t
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   * Returns: a PL/SQL table (pipelined) containing single site count data
   *
   ****/
	Function Ft_single_site_counts (p_src_type in number default null)
		Return Tb_sgl_ste_cnts
		Pipelined;

    /****
   *
   * Name: ft_import_minimal_data
   * Type: Function
   * Purpose: Pipelined streaming table function to dynamically query meta-data
   *          defining import tables to present a combined single-view dataset
   *          representing "minimal" fields mandatory for all imports
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   * Returns: a PL/SQL table (pipelined) containing minimal import dataset
   *
   ****/
    Function ft_import_minimal_data (p_src_type in number default null)
        Return tb_import_mins
        Pipelined;

   /****
   *
   * Name: ft_import_preview
   * Type: Function
   * Purpose: Pipelined streaming table function to dynamically query meta-data
   *          defining import tables to present a combined single-view dataset
   *          for use during the "preview" stage of the import process
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   * Returns: a PL/SQL table (pipelined) containing a "preview" dataset
   *
   ****/
    Function ft_import_preview (p_src_type in number default null)
        Return tb_import_preview
        Pipelined;

   /****
   *
   * name: p_wipe_down_old_data
   * Type: Procedure
   * Purpose: removes existing data in C01l schema in anticipation of
   *          being replaced by newer data. Note: only removes data relevant
   *          to what is due to be imported i.e. by unique Source type/Scenario/SCU
   *          combinations.
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   ****/
    procedure p_wipe_down_old_data(p_run_id in number, p_src_type in number default null);

    /****
   *
   * name: p_load_ind_vals
   * Type: Procedure
   * Purpose: populates Ind Value data from import tables in G01l
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   ****/
    procedure p_load_ind_vals (p_run_id in number, p_src_type in number default null);

    /****
   *
   * name: p_load_single_sites
   * Type: Procedure
   * Purpose: populates Single Site Count data from import tables in G01l
   *
   * Parameters: p_src_type - IN - (optional) code indicates the source type
   *             to be used when only a single source is required. If omitted,
   *             all source types are referenced.
   *
   ****/
    procedure p_load_single_sites (p_run_id in number, p_src_type in number default null);
END FRM_PKG02_AB_IMPORT;

/
