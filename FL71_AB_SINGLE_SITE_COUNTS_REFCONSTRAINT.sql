--------------------------------------------------------
--  Ref Constraints for Table FL71_AB_SINGLE_SITE_COUNTS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL71_AB_SINGLE_SITE_COUNTS" ADD CONSTRAINT "FL71_FL03_FK" FOREIGN KEY ("SCU_ID")
	  REFERENCES "FLOODMASTER"."FL03_FRM_SUB_CATCHMENT_UNITS" ("SCU_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL71_AB_SINGLE_SITE_COUNTS" ADD CONSTRAINT "FL71_FL61_FK" FOREIGN KEY ("SOURCE_AB_TYPE_ID")
	  REFERENCES "FLOODMASTER"."FL61_SOURCE_AB_TYPES" ("SOURCE_AB_TYPE_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL71_AB_SINGLE_SITE_COUNTS" ADD CONSTRAINT "FL71_FL62_FK" FOREIGN KEY ("SCENARIO_ID")
	  REFERENCES "FLOODMASTER"."FL62_SCENARIOS" ("SCENARIO_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL71_AB_SINGLE_SITE_COUNTS" ADD CONSTRAINT "FL71_FL64_FK" FOREIGN KEY ("RECEPTOR_ID")
	  REFERENCES "FLOODMASTER"."FL64_RECEPTORS" ("RECEPTOR_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL71_AB_SINGLE_SITE_COUNTS" ADD CONSTRAINT "FL71_FL66_FK" FOREIGN KEY ("SINGLE_SITE_TYPE_ID")
	  REFERENCES "FLOODMASTER"."FL66_SINGLE_SITE_TYPES" ("SINGLE_SITE_TYPE_ID") ENABLE;
