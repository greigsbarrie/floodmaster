--------------------------------------------------------
--  DDL for Trigger FL68_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL68_INS_TRG" 
 BEFORE INSERT
 ON FL68_AB_COVERAGES
 FOR EACH ROW
DECLARE

   l_newid fl68_ab_coverages.id%Type;
Begin
   Select fl68_seq.Nextval
   Into l_newid
   From Dual;

   :new.id := l_newid;
End;

/
ALTER TRIGGER "FLOODMASTER"."FL68_INS_TRG" ENABLE;
