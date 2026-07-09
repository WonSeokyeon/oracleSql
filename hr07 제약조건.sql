-- 무결정 제약조건( not unll, unique, primarykey, cheok,foreign key)

--1. not null
--2. unique 제약조건 == primary key 동일하다.

--emp02 생성한다.

drop table emp02;

CREATE table emp02
as
SELECT * from employees;


desc emp02;
-- 제약 조건 설정(employee_id primarty key)

SELECT * from all_constraints WHERE table_name = 'emp02';

ALTER table emp02
    add  constraint pk_emp02_id PRIMARY key(employee_id);
ALTER table emp02
  add  constraint uk_emp02_id unique(phone_number);
  
ALTER table emp02
 MODIFY phone_number VARCHAR2(20) not null;

ALTER table emp02
 drop CONSTRAINT nn_emp02_phone;

SELECT * from user_cons_columns  WHERE table_name = 'emp02';



--테이블 생성
CREATE table emp03(
empno NUMBER(4),
empname VARCHAR2(20) not null,
job VARCHAR2(20),
CONSTRAINT uk_emp03_no UNIQUE(empno)
);

INSERT into emp03 VALUES (null,'wsy','programmer');
INSERT into emp03 VALUES (1234,'wsy','programmer');
INSERT into emp03 VALUES (null,'ws2','db');

DELETE from emp03 where job ='db';

SELECT * from emp03;

UPDATE emp03 set empno = 0 WHERE empno is null;

ALTER table emp03
    MODIFY empno NUMBER(4) not null;
    
--foreign key (참조 무결성 제약조건)



--테이블설계 부서(dep)설계 테이블(부서번호(pk, 부서명uk, 지역명nt)
drop table dept;
SELECT * from user_tables WHERE table_name = 'dept';

CREATE table dept(
    deptno NUMBER(4) ,
    deptname VARCHAR2(30),
    deptloc VARCHAR2(30) CONSTRAINT nn_dept_loc not null,
    CONSTRAINT pk_dept_no primary key(deptno),
    CONSTRAINT uk_dept_name UNIQUE(deptname)
);

INSERT into dept VALUES(10,'관리과', '서울');
INSERT into dept VALUES(11,'영업팀', '서울1');
INSERT into dept VALUES(12,'개발팀', '서울2');
INSERT into dept VALUES(13,'품질팀', '서울3');
SELECT * from dept;
DELETE from dept WHERE dept.deptno= 13;
--사원 테이브(emp) dept 참조 테이블 설정(사원번호(emp_id), 사원명(emp_name), 직급(job_id), 급여(salary), 부서번호(fk)
SELECT * from user_tables WHERE table_name = 'EMP';
drop table EMP;

CREATE table EMP(
    EMPid NUMBER(4),
    EMPNAME CHAR(5) CONSTRAINT nn_emp_name not null,
    job VARCHAR2(20),
    SALARY NUMBER(10),
    deptno NUMBER(4),
    CONSTRAINT pk_EMP_id PRIMARY KEY(EMPid),
    CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) ON DELETE CASCADE
);



-- 제약조건수정(k_emp_dept_no 삭제를 하고 재 설정)
--ON DELETE CASCADE : 기본키를 지우면 참조테이블의 데이터도 같이 지움

ALTER TABLE EMP 
 DROP CONSTRAINT FK_EMP_DEPT_NO;
 
ALTER TABLE EMP
ADD CONSTRAINT FK_EMP_DEPT_NO FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO) ON DELETE CASCADE;
 



INSERT into EMP VALUES(1,'wsy','노예',10000000,13);
INSERT into EMP VALUES(2,'wsy1','노비',10000000,13);
INSERT into EMP VALUES(3,'wsy2','노비',10000000,null);
INSERT into EMP VALUES(4,'wsy3','노비',null,13);

SELECT * from emp;

UPDATE emp set deptno=12 WHERE empid=1;

DELETE from emp WHERE empid=1;


--CHECK 제약조건

--EMP table gender 추가
ALTER table emp
 add gender char(1) default 'M';

-- emptable에 gender check 제약 조건을 넣어주세요
ALTER table emp
 add CONSTRAINT ck_emp_gender CHECK(gender in('M','F','O'));
 DESC EMP;
 SELECT * FROM user_constraints WHERE table_name = 'EMP';
 SELECT * FROM user_cons_columns WHERE table_name = 'EMP';
 
 --EMP TABLE에서 GENDER제약 조건 확인
 INSERT into EMP VALUES(4,'wsy2','노비',10000000,null,'F');
--  체크 제약 조건 확인    
INSERT into EMP VALUES(5,'wsy2','노비',10000000,null,'N');

--EMP테이블에 

ALTER TABLE EMP
 ADD SCORE NUMBER(4) CONSTRAINT CK_EMP_SCORE CHECK (SCORE BETWEEN 0 AND 100);
 
 
--NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다.
--CASCADE : 참조 테이블의 튜플이 삭제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 변경되면 관련 튜플의 속성 값도 모두 변경된다.
--SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의관련 튜플의 속성 값을 NULL로 변경한다.
--SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 변경한다.
--RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가

CREATE table gogek(
    g_code NUMBER(5) , 
    g_name VARCHAR2(20),
    g_age NUMBER(3) not NULL,
    g_Addr VARCHAR2(50) not NULL,
    g_tel VARCHAR2(20)not NULL,
    CONSTRAINT pk_gogek_g_code PRIMARY key(g_code)
);

create table  video(
    v_code number(5)  not null,
    v_title varchar2(50) not null ,
    v_genre VARCHAR2(30),
    v_pay number(7) not null,
    v_lend_state number(1),
    v_make_company varchar2(50),
    v_make_date date,
    v_view_age number(1),
    CONSTRAINT pk_video_v_code PRIMARY key(v_code)
);


CREATE table lend_reture(
    lr_code number(5) not null,
    g_code number(5) not null,
    v_code NUMBER(5)   not null,
    l_data date,
    r_plan_date date,
    l_total_pay number(7),
    CONSTRAINT pk_lend_reture_lr_code PRIMARY key(lr_code),
    CONSTRAINT fk_lend_reture_gogek_g_code FOREIGN key(g_code) REFERENCES gogek(g_code) on DELETE set NULL,
    CONSTRAINT fk_lend_reture_video_v_code FOREIGN key(v_code) REFERENCES video(v_code) on DELETE set NULL
);




















