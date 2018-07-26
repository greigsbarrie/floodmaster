--------------------------------------------------------
--  Ref Constraints for Table SF19_FAULT
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF19_FAULT" ADD CONSTRAINT "SF19_SF01_FK" FOREIGN KEY ("SCHEME_ID")
	  REFERENCES "FLOODMASTER"."SF01_FLOOD_PREVENTION_SCHEME" ("SCHEME_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."SF19_FAULT" ADD CONSTRAINT "SF19_SF26_FK" FOREIGN KEY ("DEFENCE_ID")
	  REFERENCES "FLOODMASTER"."SF26_FLOOD_DEFENCE" ("DEFENCE_ID") ENABLE;