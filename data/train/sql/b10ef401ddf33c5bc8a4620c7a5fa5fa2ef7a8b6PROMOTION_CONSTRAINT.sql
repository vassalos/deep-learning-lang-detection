--------------------------------------------------------
--  Constraints for Table PROMOTION
--------------------------------------------------------

  ALTER TABLE "BROCARCL"."PROMOTION" ADD CONSTRAINT "PK_PROMOTION" PRIMARY KEY ("IDPROMOTION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "BROCARCL"."PROMOTION" MODIFY ("IDPROMOTION" NOT NULL ENABLE);
 
  ALTER TABLE "BROCARCL"."PROMOTION" MODIFY ("IDCOMMANDE" NOT NULL ENABLE);
