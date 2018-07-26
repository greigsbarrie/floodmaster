--------------------------------------------------------
--  Ref Constraints for Table FL21_PVA_CAUSES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL21_PVA_CAUSES" ADD CONSTRAINT "FL21_FL01_FK" FOREIGN KEY ("PVA_ID")
	  REFERENCES "FLOODMASTER"."FL01_PVAS" ("PVA_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL21_PVA_CAUSES" ADD CONSTRAINT "FL21_FL51_FK" FOREIGN KEY ("CAUSE_CODE")
	  REFERENCES "FLOODMASTER"."FL51_CAUSES" ("CAUSE_CODE") ENABLE;
