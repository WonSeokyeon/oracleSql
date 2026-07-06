--select 문 기능
--1. departmenes 레코드 조사

select * from departments;

-- EMPLOYEES 테이블의 모든 내용 출력
SELECT * FROM employees;

--departmenes 레코드에서 departments id, department_name

SELECT department_id, department_name from departments;

 --사원 정보가 저장된 테이블은 EMPLOYEES이고, 사원이름 칼럼은 FIRST_NAME, LAST_NAME과, 
-- 급여 칼럼은 SALARY, 입사일자 칼럼은 HIRE_DATE이다. 
SELECT first_name, last_name, salary, hire_date FROM EMPLOYEES;

--3. 컬러이름에 별칭 붙이기!!!
SELECT first_name as a, last_name as b, salary as c, hire_date as d FROM EMPLOYEES;
SELECT first_name 첫번째이름 , last_name 마지막이름, salary 급여, hire_date 입사일 FROM EMPLOYEES;

--연결연산자 (Concatenation) : 자바에서 문자여 +숫자
SELECT * from employees;
--사원번호는 100이고 사원의 이름은 Stenver king 이메일주소는 SKING입니다.

SELECT * from  employees;
SELECT '사원번호는 '|| employee_id||'이고 사원의 이름'||first_name||last_name||'입니다.' as info from employees;


--중복된 데이터 
SELECT DISTINCT job_id  from employees;

--직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID) 출력하되 중복되지 않고 
--한번씩 출력하는 쿼리문을 작성하자.

SELECT DISTINCT DEPARTMENT_ID  from employees;

--6.조건문

SELECT * from employees WHERE SALARY < 3000;

--EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라. 

SELECT * from employees WHERE department_id=110;


 --EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번과 이름, 급여를 출력 
하라. 
SELECT job_id, first_name, last_name, salary from employees WHERE salary <5000;

SELECT * from employees where first_name = 'Lex';


-이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라. 
SELECT EMPLOYEE_ID, job_id, first_name, last_name FROM employees where first_name = 'John';

--8. 날짜 데이터 조회
select * from employees where hire_date>'2008/01/01';

--9. and or 조건
--<예> 부서번호가 100번이고 직급이 FI_MGR인 직원 
select * from employees where department_id =100 and job_id = 'FI_MGR';

--급여가 5000에서 10000이하 직원 정보 출력
select * from employees where salary >=5000 and salary <= 10000;
select * from employees where salary between 5000 and 10000;
--직원번호가 134이거나 201이거나 107인 직원 정보 출력 
select * from employees where EMPLOYEE_ID=134 or EMPLOYEE_ID=201 or EMPLOYEE_ID=107;
select * from employees where EMPLOYEE_ID in(134,201,107);
select * from employees where department_id != 100  -- 강추

 --직급이 FI_MGR가 아닌 직원
select * from employees where job_id !='FI_MGR';

급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라. 
(AND 연산자와 BETWEEN AND 연산자 사용 두개모두 사용해서 보여줄것) 
-- and 사용
SELECT  employee_id, first_name, last_name, salary from employees WHERE salary >=2500 and salary <= 4500;

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary BETWEEN 2500 AND 4500;

-- 커미션비율이 0.3 이거나 0.05 이거나 0.1 중의 하나인 직원의 직원번호, 이름, 급여, 커미션 비 
--율을 출력하라. (OR 연산자와 IN 연산자 사용 모두 사용해볼것)

SELECT employee_id, first_name, last_name, salary, commission_pct FROM employees WHERE commission_pct=0.3 or commission_pct=0.05 or commission_pct=0.1

SELECT employee_id, first_name, last_name, salary, commission_pct FROM employees WHERE commission_pct in(0.3, 0.05, 0.1);


--10. LIke 연산자(_: 1글자이고 (여기 어떤 글자가와도 무관), (*:1글자 이상이거나 없거나)

--이름 중에 k를 포함하는 사원
select * from employees where first_name like 'K%';

select * from employees where last_name like '%k%';
select * from employees where first_name like '%k';

select * from employees where first_name like '_d%';

--이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라. 
select * from employees where  upper(first_name) not like '%a%';

-- 11 null은(연산, 할당, 비교)불가
select * from employees where commission_pct = Null;
select * from employees where commission_pct is Null;
select * from employees where commission_pct is not Null;

-- 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라 
select * from employees where manager_id IS NULL;

--12 order by asc, order by desc
select * from employees order by employee_id asc;
select * from employees where department_id <>100 order by employee_id asc;

--<문제> 직원번호, 이름, 급여를 급여가 높은 순으로 출력하라. 
select employee_id, first_name, last_name, salary  from employees order by  salary desc;

-- <문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.
select employee_id, first_name, last_name, hire_date from employees order by  hire_date desc;
