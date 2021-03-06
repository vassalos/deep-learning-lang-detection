SET DEFINE OFF;
CREATE TABLE L_RESHISTORY
(
  HISTORYNUMBER   NUMBER(10),
  RESNUMBER       NUMBER(9),
  SERVICESEQ      NUMBER(8),
  ACTIONSEQ       NUMBER(8),
  ACTIONORDER     NUMBER(8),
  ACTIONDATE      DATE,
  ACTIONCODE      VARCHAR2(20 BYTE),
  CREATEDBY       VARCHAR2(50 BYTE),
  SYSTEMCOMMENT   CLOB,
  SUPPLIERID      VARCHAR2(40 BYTE),
  TOURCODE        VARCHAR2(30 BYTE),
  ATTACHMENTNAME  VARCHAR2(275 BYTE),
  WHOSTAMP        VARCHAR2(50 BYTE),
  DATESTAMP       DATE
)
LOB (SYSTEMCOMMENT) STORE AS (
  TABLESPACE  DTW_ADV_TABLES
  ENABLE      STORAGE IN ROW
  CHUNK       16384
  RETENTION
  NOCACHE
  LOGGING
      STORAGE    (
                  INITIAL          80K
                  NEXT             1M
                  MINEXTENTS       1
                  MAXEXTENTS       UNLIMITED
                  PCTINCREASE      0
                  BUFFER_POOL      DEFAULT
                  FLASH_CACHE      DEFAULT
                  CELL_FLASH_CACHE DEFAULT
                 ))
TABLESPACE DTW_ADV_TABLES
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;
