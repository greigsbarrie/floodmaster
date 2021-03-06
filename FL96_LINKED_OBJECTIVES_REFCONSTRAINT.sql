--------------------------------------------------------
--  Ref Constraints for Table FL96_LINKED_OBJECTIVES
--------------------------------------------------------

  ALTER TABLE "FLOODMASTER"."FL96_LINKED_OBJECTIVES" ADD CONSTRAINT "FL96_FL85_FK" FOREIGN KEY ("LINK_TYPE_ID")
	  REFERENCES "FLOODMASTER"."FL85_OBJECTIVE_LINK_TYPES" ("LINK_TYPE_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL96_LINKED_OBJECTIVES" ADD CONSTRAINT "FL96_FL94_FK" FOREIGN KEY ("OBJECTIVE_ID")
	  REFERENCES "FLOODMASTER"."FL94_OBJECTIVES" ("OBJECTIVE_ID") ENABLE;
  ALTER TABLE "FLOODMASTER"."FL96_LINKED_OBJECTIVES" ADD CONSTRAINT "FL96_FL94_FK2" FOREIGN KEY ("LINKED_OBJECTIVE")
	  REFERENCES "FLOODMASTER"."FL94_OBJECTIVES" ("OBJECTIVE_ID") ENABLE;
