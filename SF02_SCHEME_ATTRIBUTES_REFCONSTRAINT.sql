--------------------------------------------------------
--  Ref Constraints for Table SF02_SCHEME_ATTRIBUTES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF02_SCHEME_ATTRIBUTES" ADD CONSTRAINT "SF02_SF01_FK" FOREIGN KEY ("SCHEME_ID")
	  REFERENCES "FLOODMASTER"."SF01_FLOOD_PREVENTION_SCHEME" ("SCHEME_ID") ENABLE;
