--------------------------------------------------------
--  Ref Constraints for Table FL46_FE_IMPACTS_ECON
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL46_FE_IMPACTS_ECON" ADD CONSTRAINT "FL46_FL30_FK" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "FLOODMASTER"."FL30_FLOOD_EVENTS" ("EVENT_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL46_FE_IMPACTS_ECON" ADD CONSTRAINT "FL46_FL56_FK" FOREIGN KEY ("IMPACT_CODE_ECON")
	  REFERENCES "FLOODMASTER"."FL56_IMPACTS_ECONOMY" ("IMPACT_CODE_ECON") ENABLE;