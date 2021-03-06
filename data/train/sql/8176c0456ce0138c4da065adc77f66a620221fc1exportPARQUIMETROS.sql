--------------------------------------------------------
-- Archivo creado  - martes-enero-27-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PARQUIMETROS
--------------------------------------------------------

  CREATE TABLE "OPEN4JOB"."PARQUIMETROS" 
   (	"ID" NUMBER(*,0), 
	"LATITUD" FLOAT(126), 
	"TITULO" VARCHAR2(250 BYTE), 
	"ICONO" VARCHAR2(250 BYTE), 
	"DESCRIPCION" VARCHAR2(500 BYTE), 
	"LONGITUD" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_4773706136163417" ;
REM INSERTING into OPEN4JOB.PARQUIMETROS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PARQUIMETROS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPEN4JOB"."PARQUIMETROS_PK" ON "OPEN4JOB"."PARQUIMETROS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_4773706136163417" ;
--------------------------------------------------------
--  Constraints for Table PARQUIMETROS
--------------------------------------------------------

  ALTER TABLE "OPEN4JOB"."PARQUIMETROS" ADD CONSTRAINT "PARQUIMETROS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX_4773706136163417"  ENABLE;
  ALTER TABLE "OPEN4JOB"."PARQUIMETROS" MODIFY ("ID" NOT NULL ENABLE);
