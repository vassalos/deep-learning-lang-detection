/*
** TERRITORIO NO EQUIPAMENTO DO CLIENTE
*/

ALTER TABLE CLI_EQUIP ADD TERRITORIO STR01;

ALTER TABLE MOVIMENTOS ADD TERRITORIO STR01;

SET TERM ^ ;

ALTER TRIGGER MOVIMENTOS_VENDEDOR_INS
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  /* NOME DO VENDEDOR */
  SELECT
    NOME
  FROM
    CLIENTES
  WHERE
    CODIGO = NEW.CODVENDEDOR
  INTO
    NEW.NOME_VENDEDOR;

  /* TERRITORIO DA OS */
  SELECT FIRST 1
    CE.TERRITORIO
  FROM
    CLI_EQUIP CE
  WHERE
    CE.CODCLIENTE = NEW.CODCLIENTE AND
    CE.CODMARCA = NEW.CODMARCA AND
    CE.CODMODELO = NEW.CODMODELO AND
    CE.SERIE = NEW.SERIE
  INTO
    NEW.TERRITORIO;

END
^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER MOVIMENTOS_VENDEDOR_UPD
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  /* NOME DO VENDEDOR */
  SELECT
    NOME
  FROM
    CLIENTES
  WHERE
    CODIGO = NEW.CODVENDEDOR
  INTO
    NEW.NOME_VENDEDOR;

  /* LINHA DO CLIENTE */
  SELECT
    CL.CODLINHA
  FROM
    CLIENTES CL
  WHERE
    CL.CODIGO = NEW.CODCLIENTE
  INTO
    NEW.CODLINHA;

  /* TERRITORIO DA OS */
  SELECT FIRST 1
    CE.TERRITORIO
  FROM
    CLI_EQUIP CE
  WHERE
    CE.CODCLIENTE = NEW.CODCLIENTE AND
    CE.CODMARCA = NEW.CODMARCA AND
    CE.CODMODELO = NEW.CODMODELO AND
    CE.SERIE = NEW.SERIE
  INTO
    NEW.TERRITORIO;

END
^

SET TERM ; ^

INSERT INTO SCRIPTVER(NUMERO, DATA) VALUES (334, CURRENT_TIMESTAMP);
COMMIT;

