--------------------------------------------------------
--  File created - Wednesday-May-28-2014   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table HM_SCHEME_ALT2
--------------------------------------------------------

  CREATE TABLE HM_SCHEME_ALT2 
   (	SCHEMECODE VARCHAR2(100 BYTE), 
	SCHEMENAME VARCHAR2(100 BYTE), 
	SCHEMECATEGORY VARCHAR2(100 BYTE), 
	SCHEMETYPE VARCHAR2(100 BYTE), 
	SCHEMETYPETWO VARCHAR2(100 BYTE), 
	SEBISCHEMECLASS VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 65536 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE HHI_TBS ;


