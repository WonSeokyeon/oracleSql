-- 인덱스 설정
-- 장점
-- 검색 속도가 빨라진다
-- 시스템에 걸리부하를 줄어서 시스템 전체 성능을 향상 시킨다
-- 단점
-- 인덱스를 위한 추가적인 공간이 필요하다. 
-- 인덱스를 생성하는데 시간이 걸린다.
-- 데이터의 변경 작업(INSERT/UPDATE/DELETE)이 자주 일어날 경우에는 오히려 성능이 저하된다. 


-- EMP01 테이블 삭제
DROP TABLE EMP01;
-- 테이블 복사 하여 생성
CREATE TABLE EMP01
AS
SELECT *FROM EMPLOYEES;

--인덱스 테이블 내용 조사
SELECT * FROM user_indexes WHERE table_name = 'EMP01';


--인덱스 성능 체크
SELECT * FROM EMP01;

SELECT * FROM EMP01 WHERE employee_id = 100;


--EMP01 EMPLOYEE_ID에

ALTER table EMP01
 ADD CONSTRAINT PK_EMP01_id PRIMARY key(EMPLOYEE_ID);


--first name 성능 체크

SELECT * from emp01 WHERE EMAIL like '%A%';

--first name index설정

CREATE UNIQUE INDEX ix_emp01_email
on emp01(email);

DROP INDEX ix_emp01_email;

