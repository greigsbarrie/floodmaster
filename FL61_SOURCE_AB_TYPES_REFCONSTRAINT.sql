--------------------------------------------------------
--  Ref Constraints for Table FL61_SOURCE_AB_TYPES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL61_SOURCE_AB_TYPES" ADD CONSTRAINT "FL61_FL50_FK" FOREIGN KEY ("SOURCE_CODE")
	  REFERENCES "FLOODMASTER"."FL50_SOURCES" ("SOURCE_CODE") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL61_SOURCE_AB_TYPES" ADD CONSTRAINT "FL61_FL60_FK" FOREIGN KEY ("AB_TYPE_ID")
	  REFERENCES "FLOODMASTER"."FL60_AB_TYPES" ("AB_TYPE_ID") ENABLE;
