--------------------------------------------------------
--  DDL for Trigger FL71_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL71_INS_TRG" 
 BEFORE INSERT
 ON FL71_AB_SINGLE_SITE_COUNTS
 FOR EACH ROW
DECLARE

   l_newid fl71_ab_single_site_counts.id%Type;
Begin
   Select fl71_seq.Nextval
   Into l_newid
   From Dual;

   :new.id := l_newid;
End;

/
ALTER TRIGGER "FLOODMASTER"."FL71_INS_TRG" ENABLE;
