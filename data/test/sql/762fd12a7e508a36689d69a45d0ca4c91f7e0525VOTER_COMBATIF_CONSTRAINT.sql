--------------------------------------------------------
--  Constraints for Table VOTER_COMBATIF
--------------------------------------------------------

  ALTER TABLE "G11_FLIGHT"."VOTER_COMBATIF" ADD CONSTRAINT "PK_VOTER_COMBATIF" PRIMARY KEY ("TOUR_ANNEE", "ETAPE_NUM", "SPE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "BD50_DATA"  ENABLE;
 
  ALTER TABLE "G11_FLIGHT"."VOTER_COMBATIF" MODIFY ("TOUR_ANNEE" NOT NULL ENABLE);
 
  ALTER TABLE "G11_FLIGHT"."VOTER_COMBATIF" MODIFY ("ETAPE_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "G11_FLIGHT"."VOTER_COMBATIF" MODIFY ("SPE_NUM" NOT NULL ENABLE);
 
  ALTER TABLE "G11_FLIGHT"."VOTER_COMBATIF" MODIFY ("PART_NUM" NOT NULL ENABLE);
