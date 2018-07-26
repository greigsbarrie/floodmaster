--------------------------------------------------------
--  Ref Constraints for Table FL69_AB_PROPS_COUNTS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL69_AB_PROPS_COUNTS" ADD CONSTRAINT "FL69_FL03_FK" FOREIGN KEY ("SCU_ID")
	  REFERENCES "FLOODMASTER"."FL03_FRM_SUB_CATCHMENT_UNITS" ("SCU_ID") ENABLE;
