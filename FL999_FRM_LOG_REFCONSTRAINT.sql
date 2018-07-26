--------------------------------------------------------
--  Ref Constraints for Table FL999_FRM_LOG
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL999_FRM_LOG" ADD CONSTRAINT "SYS_C00452808" FOREIGN KEY ("RUN_ID")
	  REFERENCES "FLOODMASTER"."FL998_FRM_AB_RUNS" ("RUN_ID") ENABLE;
