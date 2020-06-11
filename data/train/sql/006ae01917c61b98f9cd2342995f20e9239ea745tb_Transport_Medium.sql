--------------------------------------------------------
--  File created - Monday-February-29-2016       
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TRANSPORT_MEDIUM
--------------------------------------------------------

  CREATE TABLE "PRIYA"."TRANSPORT_MEDIUM" 
   (	"TRANSPORT_ID" NUMBER, 
	"CODE" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TRANSPORT_MEDIUM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRIYA"."TRANSPORT_MEDIUM_PK" ON "PRIYA"."TRANSPORT_MEDIUM" ("TRANSPORT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TRANSPORT_MEDIUM
--------------------------------------------------------

  ALTER TABLE "PRIYA"."TRANSPORT_MEDIUM" ADD CONSTRAINT "TRANSPORT_MEDIUM_PK" PRIMARY KEY ("TRANSPORT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "PRIYA"."TRANSPORT_MEDIUM" MODIFY ("TRANSPORT_ID" NOT NULL ENABLE);