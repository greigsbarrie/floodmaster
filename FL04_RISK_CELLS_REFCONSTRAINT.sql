--------------------------------------------------------
--  Ref Constraints for Table FL04_RISK_CELLS
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL04_RISK_CELLS" ADD CONSTRAINT "FL04_FL03_FK" FOREIGN KEY ("SCU_ID")
	  REFERENCES "FLOODMASTER"."FL03_FRM_SUB_CATCHMENT_UNITS" ("SCU_ID") ENABLE;
