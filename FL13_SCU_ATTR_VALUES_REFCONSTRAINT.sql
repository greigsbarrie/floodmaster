--------------------------------------------------------
--  Ref Constraints for Table FL13_SCU_ATTR_VALUES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL13_SCU_ATTR_VALUES" ADD CONSTRAINT "FL13_FL03_FK" FOREIGN KEY ("SCU_ID")
	  REFERENCES "FLOODMASTER"."FL03_FRM_SUB_CATCHMENT_UNITS" ("SCU_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL13_SCU_ATTR_VALUES" ADD CONSTRAINT "FL13_FL05_FK" FOREIGN KEY ("ATTRIBUTE_ID")
	  REFERENCES "FLOODMASTER"."FL05_FRM_SCU_ATTRIBUTES" ("ATTRIBUTE_ID") ENABLE;
