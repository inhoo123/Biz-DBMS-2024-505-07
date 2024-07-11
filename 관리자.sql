--관리로 접속한 화면
/*
현재 화면은 USERNAME : SYS,권환:SYSDBA 로 접속한 화면이다
SYSDBA 는 Oracle DBMS 의 매우 중요한 권한을 나타낸다.
SYSDBA는 DB 를 생성하고, 제거하고,사용자를 생성하고,제거하고,여러가지 시스템관리를 할수 있는 권한이다
따라서 SYS 사용자의 비밀번호는 잘 관리되어야 한다.
*/
--Oracle DBMS 프로젝트를 처음 시작할때는 관리자로 접속하여 TableSpace 와 User 를 생성해줘야 한다.
--TableSpace 는 C:\app\data 폴더에 생성할 것

CREATE TABLESPACE student --student 라는 이름으로 TableSpace, 데이터저장소를 선언
DATAFILE 'C:/app/data/student.dvf' --c:/app/data 폴더에 student.dbf 라는 이름의 파일을 생성하고 데이터 저장소로 하겠다
SIZE 1M -- Data 저장소의 공간을 1MByte 만큼 예약하겠다. Size 1MB 처럼 사용하면 안된다
AUTOEXTEND ON NEXT 1K; --기본 저장소 공간이 거의 채워지면, 1KB 씩 자동으로 계속 늘려라

DROP TABLESPACE student --student 라는 TableSpace 를 제거하겠다
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

/*
TableSpace : student
데이터 파일 :c:/app/data/student.dbf
최초 크기: 2M Byte
자동증가 크기 : 2 K Byte
*/
CREATE TABLESPACE student
DATAFILE 'c:/app/data/student.dbf'
SIZE 2M AUTOEXTEND ON NEXT 2K;

-- 사용자 생성
CREATE USER user1 IDENTIFIED BY 1234;