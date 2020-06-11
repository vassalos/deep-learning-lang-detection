--------------------------------------------------------
--  File created - Ïîíåäåëíèê-Àïðèë-14-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ARTICLE
--------------------------------------------------------

  CREATE TABLE "ELSYS"."ARTICLE" 
   (	"ID" NUMBER, 
	"PRICE" BLOB, 
	"URL" VARCHAR2(20 BYTE), 
	"CONTENT" VARCHAR2(204 BYTE), 
	"CATEGORY_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("PRICE") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "ELSYS"."CATEGORY" 
   (	"ID" NUMBER, 
	"CREATED_BY" VARCHAR2(20 BYTE), 
	"PRIORITY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TAG
--------------------------------------------------------

  CREATE TABLE "ELSYS"."TAG" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USER_CATEGORY
--------------------------------------------------------

  CREATE TABLE "ELSYS"."USER_CATEGORY" 
   (	"U_ID" NUMBER, 
	"C_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "ELSYS"."USERS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"AGE" NUMBER, 
	"TAG_ID" NUMBER, 
	"DESCRIPTION" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into ELSYS.ARTICLE
SET DEFINE OFF;
Insert into ELSYS.ARTICLE (ID,URL,CONTENT,CATEGORY_ID) values (1,'aasd','cqwcq',1);
Insert into ELSYS.ARTICLE (ID,URL,CONTENT,CATEGORY_ID) values (2,'qwdqwd','ververc',1);
REM INSERTING into ELSYS.CATEGORY
SET DEFINE OFF;
Insert into ELSYS.CATEGORY (ID,CREATED_BY,PRIORITY) values (1,'aasda',1);
Insert into ELSYS.CATEGORY (ID,CREATED_BY,PRIORITY) values (2,'ascxasx',1);
REM INSERTING into ELSYS.TAG
SET DEFINE OFF;
Insert into ELSYS.TAG (ID,NAME,DESCRIPTION) values (1,'acve','vcf23c');
Insert into ELSYS.TAG (ID,NAME,DESCRIPTION) values (2,'23f2d2','3cx223');
REM INSERTING into ELSYS.USER_CATEGORY
SET DEFINE OFF;
Insert into ELSYS.USER_CATEGORY (U_ID,C_ID) values (1,1);
Insert into ELSYS.USER_CATEGORY (U_ID,C_ID) values (1,2);
Insert into ELSYS.USER_CATEGORY (U_ID,C_ID) values (2,2);
REM INSERTING into ELSYS.USERS
SET DEFINE OFF;
Insert into ELSYS.USERS (ID,NAME,AGE,TAG_ID,DESCRIPTION) values (1,'qw',111,1,'scsdc');
Insert into ELSYS.USERS (ID,NAME,AGE,TAG_ID,DESCRIPTION) values (2,'as',11,2,'vcdsc');