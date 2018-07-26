--------------------------------------------------------
--  Ref Constraints for Table SF05_AREA_OF_BENEFIT
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF05_AREA_OF_BENEFIT" ADD CONSTRAINT "SF05_SF01_FK" FOREIGN KEY ("SCHEME_ID")
	  REFERENCES "FLOODMASTER"."SF01_FLOOD_PREVENTION_SCHEME" ("SCHEME_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."SF05_AREA_OF_BENEFIT" ADD CONSTRAINT "SF05_SF34_FK" FOREIGN KEY ("PRB_ID")
	  REFERENCES "FLOODMASTER"."SF34_PRODUCED_BY" ("PRB_ID") ENABLE;
