CREATE TABLE CUSTOMERS(
  CUSTOMER_ID    INTEGER      NOT NULL,
  CUSTOMER_NAME  VARCHAR(255) NOT NULL,
  
  CONSTRAINT CUSTOMERS_PK PRIMARY KEY (CUSTOMER_ID)
);


CREATE TABLE ORDERS(
  ORDER_ID     INTEGER   NOT NULL,
  ORDER_DATE   DATE      NOT NULL,
  CUSTOMER_ID  INTEGER   NOT NULL,

  CONSTRAINT ORDERS_PK PRIMARY KEY(ORDER_ID),
  CONSTRAINT ORDERS_FK01 FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);



INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME) VALUES(1,"Customer 1");
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME) VALUES(4,"Customer 4");
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME) VALUES(2,"Customer 2");
INSERT INTO CUSTOMERS(CUSTOMER_ID,CUSTOMER_NAME) VALUES(3,"Customer 3");

INSERT INTO ORDERS(ORDER_ID,ORDER_DATE,CUSTOMER_ID) VALUES(1,"2008-01-10",1);