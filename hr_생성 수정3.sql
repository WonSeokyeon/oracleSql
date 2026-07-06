--사용자가 정의한 테이블 생성하기(emo01)속성(사원번호, 이름, 연봉)

CREATE TABLE EMP01(
    empno number(4),
    name VARCHAR2(20),
    salary NUMBER(7,2)
);

SELECT *from EMP01;