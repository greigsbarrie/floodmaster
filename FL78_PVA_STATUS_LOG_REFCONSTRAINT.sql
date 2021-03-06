--------------------------------------------------------
--  Ref Constraints for Table FL78_PVA_STATUS_LOG
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL78_PVA_STATUS_LOG" ADD CONSTRAINT "FL78_FL01_FK" FOREIGN KEY ("PVA_ID")
	  REFERENCES "FLOODMASTER"."FL01_PVAS" ("PVA_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL78_PVA_STATUS_LOG" ADD CONSTRAINT "FL78_FL74_FK" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "FLOODMASTER"."FL74_PVA_STATUS" ("STATUS_ID") ENABLE;
