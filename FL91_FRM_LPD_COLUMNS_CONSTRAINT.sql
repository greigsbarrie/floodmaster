--------------------------------------------------------
--  Constraints for Table FL91_FRM_LPD_COLUMNS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL91_FRM_LPD_COLUMNS" ADD CONSTRAINT "FL91_CHK_IPF" CHECK (IGNORE_PUBLISH_FLAG IN ('Y','N')) ENABLE;
