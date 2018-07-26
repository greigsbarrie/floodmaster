--------------------------------------------------------
--  Ref Constraints for Table FL88_ACTION_CATEGORY_TO_EC
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL88_ACTION_CATEGORY_TO_EC" ADD CONSTRAINT "FL88_FL87_FK" FOREIGN KEY ("ACTION_CATEGORY_ID")
	  REFERENCES "FLOODMASTER"."FL87_ACTION_CATEGORIES" ("ACTION_CATEGORY_ID") ENABLE;
