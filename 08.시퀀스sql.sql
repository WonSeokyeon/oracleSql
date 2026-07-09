석연
wonseokyeon
온라인

석연 — 2026-07-06 오전 10:40
ㅋㅋㅋㅋ
정석 — 2026-07-06 오전 10:40
잉글랜드 선수들 주급만 엄청날텐데요
석연 — 2026-07-06 오후 3:52
-- 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라 
select * from employees where manager_id IS NULL;

--12 order by asc, order by desc
select * from employees order by employee_id asc;
select * from employees where department_id <>100 order by employee_id asc;
석연 — 2026-07-07 오전 11:03
INSERT INTO TB_CUSTOMER (
    CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM
) VALUES (
    '2017042', '강원진', 'M', '19810603', '010-8202-8790', 'wjgang@navi.com', 280300, '20170123132432'
);
INSERT INTO TB_CUSTOMER (
    CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM
) VALUES (
    '2017053', '나경숙', 'W', '19891225', '010-4509-0043', 'ksna@boram.co.kr', 4500, '20170210180930'
);
INSERT INTO TB_CUSTOMER (
    CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM
) VALUES (
    '2017108', '박승대', 'M', '19710430', ' NULL', 'sdpark@haso.com', 23450, '20170508203450'
);
정석 — 2026-07-07 오후 3:28
그냥 it에 관심이 없던거 아니에요?
석연 — 2026-07-07 오후 3:57
ㅋㅋㅋㅋ그냥 하기 싫었떤거!!
정석 — 어제 오전 9:43
nvarchar 얘는 첨보는 아이인데
정석 — 어제 오전 10:43
근데 여기는 미소야가 없네요
석연 — 어제 오전 10:57
미소야 돈까스~ㅋ 올만이다
정석 — 오전 10:47
-- 시퀀스 생성
-- CREATE SEQUENCE sequence_name      -- 시퀸스이름
-- [START WITH n] ①                  -- 시작값 1
-- [INCREMENT BY n] ②                -- 증가값 +1
-- [{MAXVALUE n | NOMAXVALUE}] ③     -- 최대값 100
-- [{MINVALUE n | NOMINVALUE}] ④     -- 최소값 0
-- [{CYCLE | NOCYCLE}] ⑤             -- 1 -> 100 그다음에 cycle 다시 1부터시작
-- [{CACHE n | NOCACHE}] ⑥           -- 캐시메모리(속도향상)

-- 테이블설계 + 시퀸스설계 + 인덱스설계 + (트리거,프로시져,함수 => 프로그램:조건문,반복문,예외처리)

-- 시퀸스설계(emp_seq,초기값 0,증가치 1, 최소값 0, 최대값 10000, nocycle, cache 2)
CREATE SEQUENCE emp_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000
NOCYCLE
CACHE 2;

-- emp01 삭제를 진행하고, employees에서 id, first_name, hire_date 구조만 복사하시오.
DROP TABLE emp01;

CREATE TABLE emp01
as
SELECT employee_id, first_name, hire_date
FROM employees
WHERE 1=0;

desc emp01;
SELECT * FROM emp01;

-- 시퀸스를 이용해서 데이터 입력
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);

SELECT * FROM user_tables;
SELECT * FROM user_constraints;
SELECT * FROM user_cons_columns;
SELECT * FROM user_sequences;

-- emp_seq가 현재 얼마까지 설정이 되었는지 확인
-- 가상테이블을 통해서 확인
-- CURRVAL : 현재 값을 반환 
-- NEXTVAL : 현재 시퀀스 값의 다음 값을 반환
SELECT emp_seq.currval FROM dual;

-- dep_seq
CREATE SEQUENCE dep_seq
START WITH 10
INCREMENT BY 10
MINVALUE 0
MAXVALUE 30
NOCYCLE
CACHE 2;

-- dept01 테이블삭제후 생성 구조만복사(department_id,department_name,location_id)
DROP TABLE dept01;
CREATE TABLE dept01
as
SELECT department_id,department_name,location_id
FROM departments
WHERE 1 = 0;

SELECT * FROM dept01;

-- dept01에서 데이터를 삽입하시오
INSERT INTO dept01 VALUES (dep_seq.nextval,'관리과',1);
INSERT INTO dept01 VALUES (dep_seq.nextval,'총무과',2);
INSERT INTO dept01 VALUES (dep_seq.nextval,'서무과',3);
INSERT INTO dept01 VALUES (dep_seq.nextval,'인사과',4);

-- dep_seq 값 maxvalue 초과되었으므로 maxvalue 1000으로 수정
-- alter sequence 시퀀스네임
-- ALTER SEQUENCE sequence_name 
-- [INCREMENT BY n] 
-- [{MAXVALUE n | NOMAXVALUE}] 
-- [{MINVALUE n | NOMINVALUE}] 
-- [{CYCLE | NOCYCLE}] 
-- [{CACHE n | NOCACHE}]

ALTER SEQUENCE dep_seq
MAXVALUE 1000;

-- 시퀸스 삭제
-- DROP SEQUENCE sequence_name; 

-- dep_seq 삭제하시오.
DROP SEQUENCE dep_seq;





08hr_sequence.sql
3KB
﻿
-- 시퀀스 생성
-- CREATE SEQUENCE sequence_name      -- 시퀸스이름
-- [START WITH n] ①                  -- 시작값 1
-- [INCREMENT BY n] ②                -- 증가값 +1
-- [{MAXVALUE n | NOMAXVALUE}] ③     -- 최대값 100
-- [{MINVALUE n | NOMINVALUE}] ④     -- 최소값 0
-- [{CYCLE | NOCYCLE}] ⑤             -- 1 -> 100 그다음에 cycle 다시 1부터시작
-- [{CACHE n | NOCACHE}] ⑥           -- 캐시메모리(속도향상)

-- 테이블설계 + 시퀸스설계 + 인덱스설계 + (트리거,프로시져,함수 => 프로그램:조건문,반복문,예외처리)

-- 시퀸스설계(emp_seq,초기값 0,증가치 1, 최소값 0, 최대값 10000, nocycle, cache 2)
CREATE SEQUENCE emp_seq
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000
NOCYCLE
CACHE 2;

-- emp01 삭제를 진행하고, employees에서 id, first_name, hire_date 구조만 복사하시오.
DROP TABLE emp01;

CREATE TABLE emp01
as
SELECT employee_id, first_name, hire_date
FROM employees
WHERE 1=0;

desc emp01;
SELECT * FROM emp01;

-- 시퀸스를 이용해서 데이터 입력
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);
INSERT INTO emp01 VALUES (emp_seq.nextval,'ojs',sysdate);

SELECT * FROM user_tables;
SELECT * FROM user_constraints;
SELECT * FROM user_cons_columns;
SELECT * FROM user_sequences;

-- emp_seq가 현재 얼마까지 설정이 되었는지 확인
-- 가상테이블을 통해서 확인
-- CURRVAL : 현재 값을 반환 
-- NEXTVAL : 현재 시퀀스 값의 다음 값을 반환
SELECT emp_seq.currval FROM dual;

-- dep_seq
CREATE SEQUENCE dep_seq
START WITH 10
INCREMENT BY 10
MINVALUE 0
MAXVALUE 30
NOCYCLE
CACHE 2;

-- dept01 테이블삭제후 생성 구조만복사(department_id,department_name,location_id)
DROP TABLE dept01;
CREATE TABLE dept01
as
SELECT department_id,department_name,location_id
FROM departments
WHERE 1 = 0;

SELECT * FROM dept01;

-- dept01에서 데이터를 삽입하시오
INSERT INTO dept01 VALUES (dep_seq.nextval,'관리과',1);
INSERT INTO dept01 VALUES (dep_seq.nextval,'총무과',2);
INSERT INTO dept01 VALUES (dep_seq.nextval,'서무과',3);
INSERT INTO dept01 VALUES (dep_seq.nextval,'인사과',4);

-- dep_seq 값 maxvalue 초과되었으므로 maxvalue 1000으로 수정
-- alter sequence 시퀀스네임
-- ALTER SEQUENCE sequence_name 
-- [INCREMENT BY n] 
-- [{MAXVALUE n | NOMAXVALUE}] 
-- [{MINVALUE n | NOMINVALUE}] 
-- [{CYCLE | NOCYCLE}] 
-- [{CACHE n | NOCACHE}]

ALTER SEQUENCE dep_seq
MAXVALUE 1000;

-- 시퀸스 삭제
-- DROP SEQUENCE sequence_name; 

-- dep_seq 삭제하시오.
DROP SEQUENCE dep_seq;

-- 사전
SELECT * FROM user_tables;
SELECT * FROM user_constraints;
SELECT * FROM user_cons_columns;
SELECT * FROM user_sequences;
SELECT * FROM user_indexes where table_name = 'EMPLOYEES';
SELECT * FROM user_ind_columns where table_name= 'EMPLOYEES';


