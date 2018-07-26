--------------------------------------------------------
--  DDL for Trigger FL67_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL67_INS_TRG" 
 BEFORE INSERT
 ON FL67_AB_VALID_COMBINATIONS
 FOR EACH ROW
DECLARE

   l_neqid fl67_ab_valid_combinations.id%Type;
Begin
   Select fl67_seq.Nextval
   Into l_neqid
   From Dual;

   :new.id := l_neqid;
End;

/
ALTER TRIGGER "FLOODMASTER"."FL67_INS_TRG" ENABLE;
