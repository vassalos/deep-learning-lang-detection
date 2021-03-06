--------------------------------------------------------
--  DDL for Table ISSUE_TYPE
--------------------------------------------------------

  CREATE TABLE "ISSUE_TYPE" 
   (	"ISSUE_TYPE_CODE" VARCHAR2(20 BYTE), 
	"ISSUE_TYPE_NAME" VARCHAR2(20 BYTE), 
	"ACTIVE" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"CREATED_DATE" DATE, 
	"CHANGED_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
