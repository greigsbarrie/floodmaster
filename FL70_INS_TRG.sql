--------------------------------------------------------
--  DDL for Trigger FL70_INS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "FLOODMASTER"."FL70_INS_TRG" 
 BEFORE INSERT
 ON FL70_AB_FR_IND_VALUES
 FOR EACH ROW
DECLARE

   l_newid fl70_ab_fr_ind_values.id%Type;
Begin
   Select fl70_seq.Nextval
   Into l_newid
   From Dual;

   :new.id := l_newid;
End;

/
ALTER TRIGGER "FLOODMASTER"."FL70_INS_TRG" ENABLE;
