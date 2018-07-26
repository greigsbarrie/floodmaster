--------------------------------------------------------
--  Ref Constraints for Table FL26_PVA_IMPACTS_ECON
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL26_PVA_IMPACTS_ECON" ADD CONSTRAINT "FL26_FL01_FK" FOREIGN KEY ("PVA_ID")
	  REFERENCES "FLOODMASTER"."FL01_PVAS" ("PVA_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL26_PVA_IMPACTS_ECON" ADD CONSTRAINT "FL26_FL56_FK" FOREIGN KEY ("IMPACT_CODE_ECON")
	  REFERENCES "FLOODMASTER"."FL56_IMPACTS_ECONOMY" ("IMPACT_CODE_ECON") ENABLE;