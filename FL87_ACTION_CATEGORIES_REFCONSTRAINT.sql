--------------------------------------------------------
--  Ref Constraints for Table FL87_ACTION_CATEGORIES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL87_ACTION_CATEGORIES" ADD CONSTRAINT "FL87_FL86_FK" FOREIGN KEY ("ACTION_TYPE_ID")
	  REFERENCES "FLOODMASTER"."FL86_ACTION_TYPES" ("ACTION_TYPE_ID") ENABLE;
