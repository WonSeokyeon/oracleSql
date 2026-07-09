CREATE table customers(
    ﻿CUSTOMER_ID NUMBER(10),
    ﻿CUSTOMER_NAME VARCHAR2(10) not null,
    age NUMBER(5) not null,
    ﻿PHONE VARCHAR2(30) NOT NULL,
    CONSTRAINT pk_customers_CUSTOMER_ID PRIMARY key(CUSTOMER_ID),
    CONSTRAINT ck_customers_age CHECK(age BETWEEN 1 and 130),
    CONSTRAINT Uk_customers_PHONE UNIQUE(﻿PHONE)
);

DROP TABLE CUSTOMERS;

INSERT INTO customers VALUES (101, '김석우', 65, '010-1234-5678');
INSERT INTO customers VALUES (102, '이순자', 72, '010-9876-5432');
INSERT INTO customers VALUES (103, '박정호', 61, '010-5555-4444');
INSERT INTO customers VALUES (104, '정명숙', 68, '010-2222-3333');

SELECT *FROM customers;

CREATE TABLE orders (
    order_id     NUMBER(10),
    customer_id  NUMBER(10),
    product_name VARCHAR2(50) NOT NULL,
    price        NUMBER(20) NOT NULL,
    CONSTRAINT pk_orders_order_id PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customers_customer_id FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id) ON DELETE SET NULL
);
INSERT INTO orders (order_id, customer_id, product_name, price) VALUES (1, 101, '갤럭시 S24', 1150000);
INSERT INTO orders (order_id, customer_id, product_name, price) VALUES (2, 102, '아이폰 15', 1250000);
INSERT INTO orders (order_id, customer_id, product_name, price) VALUES (3, 101, '갤럭시 워치 6', 350000);
INSERT INTO orders (order_id, customer_id, product_name, price) VALUES (4, 103, '효도라디오', 45000);
INSERT INTO orders (order_id, customer_id, product_name, price) VALUES (5, 104, '스마트폰 케이스', 25000);

SELECT  * FROM orders;

--1번 
SELECT c.customer_name, o.product_name, o.price 
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id;
--2번 백만원 이상 조건
SELECT c.customer_name, o.product_name, o.price 
FROM customers c 
INNER JOIN orders o 
ON c.customer_id = o.customer_id
where o.price >=1000000;
