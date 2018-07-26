--------------------------------------------------------
--  Ref Constraints for Table SF16_SURVEYED_CROSS_SECTION
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF16_SURVEYED_CROSS_SECTION" ADD CONSTRAINT "SF16_SF01_FK" FOREIGN KEY ("SCHEME_ID")
	  REFERENCES "FLOODMASTER"."SF01_FLOOD_PREVENTION_SCHEME" ("SCHEME_ID") ENABLE;
