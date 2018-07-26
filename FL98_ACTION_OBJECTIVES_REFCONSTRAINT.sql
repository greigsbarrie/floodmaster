--------------------------------------------------------
--  Ref Constraints for Table FL98_ACTION_OBJECTIVES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL98_ACTION_OBJECTIVES" ADD CONSTRAINT "FL98_FL90_FK" FOREIGN KEY ("ACTION_CATEGORY_ID", "ACTION_STATUS_ID")
	  REFERENCES "FLOODMASTER"."FL90_ACTION_CATEGORY_TO_STATUS" ("ACTION_CATEGORY_ID", "ACTION_STATUS_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL98_ACTION_OBJECTIVES" ADD CONSTRAINT "FL98_FL94_FK" FOREIGN KEY ("OBJECTIVE_ID")
	  REFERENCES "FLOODMASTER"."FL94_OBJECTIVES" ("OBJECTIVE_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL98_ACTION_OBJECTIVES" ADD CONSTRAINT "FL98_FL97_FK" FOREIGN KEY ("ACTION_ID")
	  REFERENCES "FLOODMASTER"."FL97_ACTIONS" ("ACTION_ID") ENABLE;
