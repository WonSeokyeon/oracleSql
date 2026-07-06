--1. 테이블 스페이스 생성하기

create tablespace firstData
datafile 'C:\Oraclexe\oradata\XE/first01.def' size 10M;

--저장공간 수정
alter tablespace firstData
add datafile 'C:\Oraclexe\oradata\XE/first02.def' size 10M;

--저장공간 사이즈 수정
alter database
datafile  'C:\Oraclexe\oradata\XE/first02.def' resize 20M;

--저장공간 자동설정(기존 부족시 1m증가, 최대 20M)
alter database
datafile 'C:\Oraclexe\oradata\XE/first01.def'
autoextend on 
next 1M
maxsize 20M; 

--저장공간 삭제
drop tablespace firstData including contents and datafiles;

--사용자 설정
ALTER SESSION SET "_ORACLE_SCRIPT"=true; 

create user javauser IDENTIFIED by javauser1234
DEFAULT TABLESPACE firstData
TEMPORARY TABLESPACE temp;


--사용자 권한 설정(javauser에게 접속권한, 테이블 CURD 기능부여
GRANT CONNECT,RESOURCE to javauser;

--접속요청을 진행함




