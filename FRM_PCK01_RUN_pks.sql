--------------------------------------------------------
--  DDL for Package FRM_PCK01_RUN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "FLOODMASTER"."FRM_PCK01_RUN" IS
/******************************************************************************
   NAME:       FRM_PCK01_RUN
   TYPE:       Package Specification
   PURPOSE:    to encapsulate procedures and functions that create FRM AB import
               Runs.

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        28/05/2013   Joel Cooney     Created this package.
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
   * Constant Functions
   *
   ****/

   function fc_run_status_NEW return number deterministic;

   function fc_run_status_INPROGRESS return number deterministic;

   function fc_run_status_COMPLETE return number deterministic;

   function fc_run_status_ERROR return number deterministic;

   /****
   *
   * Name: f_create_run
   * Type: Function
   * Purpose: Creates a new FRM AB import Run.
   *
   * Returns: A New Run ID
   *
   ****/
   function f_create_run return number;

   /****
   *
   * Name: p_create_run
   * Type: Procedure
   * Purpose: Sets the status of a Run
   *
   *
   ****/
   procedure p_set_run_status(p_run_id in number, p_run_status in number);
END FRM_PCK01_RUN;

/
