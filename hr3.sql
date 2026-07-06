--사용자가 정의한 테이블 생성하기(emo01)속성(사원번호, 이름, 연봉)

CREATE TABLE EMP01(
    empno number(4) not null pr ,
    name VARCHAR2(20),
    salary NUMBER(7,2)
);

SELECT *from EMP01;

--기존 테이블 복사(EMPLOYESS을 2로 복사)
CREATE TABLE employees2
as
SELECT * from employees;

SELECT *from employees2;
desc employees2;

-- 테이블에 대한 정보가 기록된 테이블(tab)
SELECT * from tab;

--테이블 컬럼수정(추가 alter add 컬럼 , 수정 alter modify 컬럼, 삭제 alter drop 컬럼)

--ALTER TABLE table_name ADD(column_name data_type expr, …);

alter table employees2 add(job varchar2(10));
-<문제> 이미 존재하는 EMP01 테이블에 입사일 칼럼(CREDATE)을 날짜형으로 추가하라.
alter table employees2 add(credate DATE);


--ALTER TABLE table_name MODIFY(column_name data_type expr, …);
--<예> 직급을 최대 30자까지 입력할 수 있도록 크기 수정
ALTER table employees2 modify(job varchar2(20));
desc employees2;

--<예> 직급을 최대 30자까지 타입을  numver입력할 수 있도록 크기 수정
ALTER table employees2 modify(job number(10));


--ALTER TABLE로 기존 칼럼명 변경
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;



ALTER TABLE employees2
    RENAME COLUMN JOB TO JOB_COPY;
    
--ALTER TABLE 기존 COLUMU 삭제
    
    --테이블 삭제
    ALTER TABLE employees2 DROP COLUMN JOB_COPY;
DROP TABLE employees2;

--테이블 명 변경
rename employees2 to employees3;

select * from tab;

select* from employees3;
truncate table employees3;
desc employees3;

CREATE table TB_CUSTOMER(
 CUSTOMER_CD CHAR(7) NOT NULL PRIMARY KEY,
 CUSTOMER_NM VARCHAR2(20) NOT NULL,
 MW_FLG CHAR(1) NOT NULL,
 BIRTH_DAY CHAR(1) NOT NULL,
 PHONE_NUMBER VARCHAR(16),
 EMAIL VARCHAR(30),
 TOTAL_POINT NUMBER(10),
 REG_DTTM CHAR(14)
);

desc TB_CUSTOMER;

--학생 성적 테이블을 만들어 봅시다.
--1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
--2.이름은 문자데이터며 null값을 허용하지 않고
--국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.
--단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다.
--총점과 평균 컬럼은 기본값을 0을 갖습니다.


CREATE table Grades(
    classnumber number(10) PRIMARY KEY,
    name VARCHAR2(10) not null,
    kor number(5) DEFAULT 0 not null,
    eng number(5) DEFAULT 0 not null,
    math number(5) DEFAULT 0 not null,
    total number(5) DEFAULT 0,
    avg number(5)  DEFAULT 0  
);
desc Grades;





