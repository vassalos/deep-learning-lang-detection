--------------------------------------------------------
--  Constraints for Table PRT_WORK_TIME
--------------------------------------------------------

  ALTER TABLE "PRT_WORK_TIME" ADD CONSTRAINT "PK_WK_TIME" PRIMARY KEY ("WK_TIME_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "PRT_WORK_TIME" MODIFY ("WK_TIME_ID" NOT NULL DISABLE);