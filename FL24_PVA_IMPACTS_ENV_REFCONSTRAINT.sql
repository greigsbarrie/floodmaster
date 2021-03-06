--------------------------------------------------------
--  Ref Constraints for Table FL24_PVA_IMPACTS_ENV
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL24_PVA_IMPACTS_ENV" ADD CONSTRAINT "FL24_FL01_FK" FOREIGN KEY ("PVA_ID")
	  REFERENCES "FLOODMASTER"."FL01_PVAS" ("PVA_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL24_PVA_IMPACTS_ENV" ADD CONSTRAINT "FL24_FL54_FK" FOREIGN KEY ("IMPACT_CODE_ENV")
	  REFERENCES "FLOODMASTER"."FL54_IMPACTS_ENVIRONMENT" ("IMPACT_CODE_ENV") ENABLE;
