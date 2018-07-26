--------------------------------------------------------
--  Ref Constraints for Table FL43_FE_IMPACTS_HH
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL43_FE_IMPACTS_HH" ADD CONSTRAINT "FL43_FL30_FK" FOREIGN KEY ("EVENT_ID")
	  REFERENCES "FLOODMASTER"."FL30_FLOOD_EVENTS" ("EVENT_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL43_FE_IMPACTS_HH" ADD CONSTRAINT "FL43_FL53_FK" FOREIGN KEY ("IMPACT_CODE_HH")
	  REFERENCES "FLOODMASTER"."FL53_IMPACTS_HUMAN_HEALTH" ("IMPACT_CODE_HH") ENABLE;