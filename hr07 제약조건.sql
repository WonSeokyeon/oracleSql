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
DELETE from dept WHERE dept.deptno= 12;
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
    CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno)
);

INSERT into EMP VALUES(1,'wsy','노예',10000000,13);
INSERT into EMP VALUES(2,'wsy1','노비',10000000,13);

SELECT * from emp;

UPDATE emp set deptno=12 WHERE empid=1;

DELETE from emp WHERE empid=1;
    

























--사원 테이브(emp) dept 참조 테이블 설정(사원번호(emp_id), 사원명(emp_name), 직급(job_id), 급여(salary), 부서번호(fk)
--테이블설계 부서(dep)설계 테이블(부서번호(pk, 부서명uk, 지역명nt)
CREATE table dept(
    deptno NUMBER(10),
    deptname VARCHAR2(20),
    deptloc VARCHAR2(50) CONSTRAINT nn_dept_loc not null,
    CONSTRAINT pk_dept_no PRIMARY key(deptno),
    CONSTRAINT uk_dept_name UNIQUE(deptname)
);

CREATE table emp(
    empid NUMBER(10),
    empname VARCHAR2(10),
    empjob VARCHAR2(20),
    empsalary NUMBER(20),
    deptno NUMBER(10),
    CONSTRAINT pk_emp_id PRIMARY key(empid),
    CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno) on delete CASCADE
    
);

