--UPDATE table_name
--SET column_name1 = value1, column_name2 = value2, …
--WHERE conditions;

CREATE TABLE emp2
as
SELECT * from employees;

desc emp;
SELECT * from emp;
--제약 조건을 걸고, 해지하는 거
alter TABLE emp
add constraint pk_emp_id PRIMARY key(employee_id);

ALTER TABLE EMP
 DROP constraint pk_emp_id;
 
ALTER TABLE EMP
 MODIFY PHONE_NUMBER varchar2(20) CONSTRAINT nn_emp_phone not null;
 
ALTER table EMP
drop CONSTRAINT nn_nmp_phone;


SELECT * from user_constraints WHERE table_name= 'EMP';

--모든 사원의 부서번호를 30번으로 수정하자.

desc emp;
UPDATE EMPLOYEES set salary= salary * 1.1;

SELECT salary_copy, salary from EMPLOYEES;

UPDATE  emp set department_id =30;
SELECT department_id from emp;
-- dml
ROLLBACK;
-- salary_copy 컬럼을 ADD하고, salary를 복사한다.
ALTER TABLE EMPLOYEES 
ADD salary_copy NUMBER(20);

UPDATE  EMPLOYEES set
salary_copy= salary;


SELECT salary_copy from EMPLOYEES;



--- emp에서 입사일을 오늘 날짜로 수정한다.
UPDATE EMPLOYEES set hire_date = sysdate;
SELECT * from EMPLOYEES;

--  부서 번호가 10번인 사원에 부서번호를 30번으로 수정하시오

ROLLBACK;

UPDATE emp2 set department_id = 30 WHERE department_id =10;
SELECT department_id from emp2;



--- emp2 table에서 급여가 3000이상인 사원만 급여 10% 인상

UPDATE emp2 SET salary = salary*1.1 where salary >=3000;
SELECT salary from emp2;


-- 2007년 입사한 사원의 입사일을 오늘로 수정한다.

SELECT * from emp2;
SELECT * from employees;


--LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.

UPDATE emp2  set salary = 17000, commission_pct = 0.45 where last_name='Russell';

SELECT * from emp2;
