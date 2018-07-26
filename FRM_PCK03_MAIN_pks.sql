--------------------------------------------------------
--  DDL for Package FRM_PCK03_MAIN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "FLOODMASTER"."FRM_PCK03_MAIN" IS
 /******************************************************************************
   NAME:       FRM_PCK03_MAIN
   TYPE:       Package Specification
   PURPOSE:    to encapsulate procedures and functions that initiate FM AB
               processes

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        23/05/2013   Joel Cooney     Created this package.
******************************************************************************/

/****
*
* Types
*
****/

/****
*
* Functions + Procedures
*
****/

   /****
   *
   * Name: p_ab_import
   * Type: Procedure
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
   *
   ****/
   procedure p_ab_import (p_src_type in number default null);
END FRM_PCK03_MAIN;

/
