--------------------------------------------------------
--  Ref Constraints for Table FL64_RECEPTORS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL64_RECEPTORS" ADD CONSTRAINT "FL64_FL63_FK" FOREIGN KEY ("RECEPTOR_CATEGORY_ID")
	  REFERENCES "FLOODMASTER"."FL63_RECEPTOR_CATEGORIES" ("RECEPTOR_CATEGORY_ID") ENABLE;
