--------------------------------------------------------
--  Ref Constraints for Table SF15_CONDITION_ASSESSMENT_NOTE
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF15_CONDITION_ASSESSMENT_NOTE" ADD CONSTRAINT "SF15_SF01_FK" FOREIGN KEY ("SCHEME_ID")
	  REFERENCES "FLOODMASTER"."SF01_FLOOD_PREVENTION_SCHEME" ("SCHEME_ID") ENABLE;
