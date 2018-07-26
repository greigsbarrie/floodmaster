--------------------------------------------------------
--  Ref Constraints for Table SF28_DEFENCE_ATTRIBUTE_LOOKUP
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."SF28_DEFENCE_ATTRIBUTE_LOOKUP" ADD CONSTRAINT "SF28_SF24_FK" FOREIGN KEY ("ATTRIBUTE_ID")
	  REFERENCES "FLOODMASTER"."SF24_ATTRIBUTES" ("ATTRIBUTE_ID") ENABLE;
