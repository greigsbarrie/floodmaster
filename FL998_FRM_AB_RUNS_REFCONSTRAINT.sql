--------------------------------------------------------
--  Ref Constraints for Table FL998_FRM_AB_RUNS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL998_FRM_AB_RUNS" ADD CONSTRAINT "FK_FL998_RUN_STATUS" FOREIGN KEY ("RUN_STATUS")
	  REFERENCES "FLOODMASTER"."FL997_FRM_AB_RUN_STATUS" ("RUN_STATUS_ID") ENABLE;
