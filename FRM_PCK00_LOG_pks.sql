--------------------------------------------------------
--  DDL for Package FRM_PCK00_LOG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "FLOODMASTER"."FRM_PCK00_LOG" IS
/******************************************************************************
  NAME:       FRM_PCK00_LOG
  TYPE:       Package Specification
  PURPOSE:    Utility package to collect logging data related to FRM

  REVISIONS:
  Ver        Date        Author           Description
  ---------  ----------  ---------------  ------------------------------------
  1.0        27/05/2013   Joel Cooney     Created this package.
******************************************************************************/

/***
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
   * Name: p_log_entry
   * Type: Procedure
   * Purpose: creates new log entries
   *
   * Parameters: p_log_source - IN - texual description of the calling
   *                                 module/procedure. At developer's discretion
   *                                 what to enter here
   *             p_log_value - IN - textual entry the developer wishes to log.
   *                                Value used at developer discretion.
   *             p_log_level - IN - Numerical valuue indicate the log "level"
   *                                level 1 is the highest (most critical)
   *                                level 9999 is the lowest (least critical)
   *                                Value used at developer discretion.
   *
   *
   ****/
   Procedure p_log_entry (
      p_log_source In Varchar2
      ,p_log_value In Varchar2
      ,p_run_id    In Number default null
      ,p_log_level In Number Default 9999
   );
END FRM_PCK00_LOG;

/
