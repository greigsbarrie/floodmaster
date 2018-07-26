--------------------------------------------------------
--  Ref Constraints for Table FL11_FLOOD_ICCS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL11_FLOOD_ICCS" ADD CONSTRAINT "FL11_FL03_FK" FOREIGN KEY ("SCU_ID")
	  REFERENCES "FLOODMASTER"."FL03_FRM_SUB_CATCHMENT_UNITS" ("SCU_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL11_FLOOD_ICCS" ADD CONSTRAINT "FL11_GE4_FK" FOREIGN KEY ("GE4_CONFLUENCE_ID")
	  REFERENCES "GENERAL"."GE4_BASELINE_CONFLUENCES" ("GE4_CONFLUENCE_ID") ENABLE;
