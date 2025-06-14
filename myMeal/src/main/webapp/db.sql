create table course_tbl
(
	--교과목 아이디
	id varchar2(5) not null primary key,
--	교과목 명
	name varchar2(40),
--	학점
	credit number(6),
--	강사
	lecturer varchar2(10),
--	요일
	week number(2),
--	시작시간
	start_hour number(4),
--	종료시간
	end_end number(4)
);

insert into course_tbl
values ('10001', '프로그래밍', 2, '1', 1, 0900, 1100);
insert into course_tbl
values ('10002', '객체지향 프로그래밍', 2, '2', 2, 0900, 1200);
insert into course_tbl
values ('10003', '자료구조', 3, '4', 3, 0900, 1200);
insert into course_tbl
values ('10004', '알고리즘', 3, '4', 4, 0900, 1200);
insert into course_tbl
values ('20001', '시스템 프로그래밍', 2, '5', 1, 1300, 1600);
insert into course_tbl
values ('20002', '운영체제', 3, '5', 2, 1500, 1800);
insert into course_tbl
values ('20003', '오토마타와 컴파일러', 3, '5', 3, 1330, 1630);
insert into course_tbl
values ('30001', '소프트웨어 공학', 2, '3', 4, 1330, 1530);
insert into course_tbl
values ('30002', '시스템 분석및 설계', 3, '3', 5, 0900, 1200);
insert into course_tbl
values ('40001', '데이터베이스', 3, '2', 5, 1300, 1600);

select * from course_tbl
create table lecturer_tbl(
	--번호
	idx number(6) not null primary key,
	--강사명
	name varchar2(10),
	--전공
	major varchar2(30),
	--연구분야
	field varchar2(30)
);
insert into lecturer_tbl 
values (1, '김교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl 
values (2, '이교수', '소프트웨어공학', '인공지능');
insert into lecturer_tbl 
values (3, '박교수', '소프트웨어공학', '소프트웨어공학');
insert into lecturer_tbl 
values (4, '우교수', '소프트웨어공학', '알고리즘');
insert into lecturer_tbl 
values (5, '최교수', '응용컴퓨터공학', '임베디드 시스템');
insert into lecturer_tbl 
values (6, '강교수', '응용컴퓨터공학', '멀티미디어');
insert into lecturer_tbl 
values (7, '황교수', '모바일시스템공학', '네트워크');
insert into lecturer_tbl 
values (8, '독교수', '모바일시스템공학', '네트워크');

select count(*) from course_tbl
select * from course_tbl
delete course_tbl where lecturer = 12

select id, c.name,credit, l.name, case when week = 1 then '월' when week = 2 then '화' when week = 3 then '수' when week = 4 then '목' when week = 5 then '금' when week = 6 then '토' end as week, start_hour, end_end 
from course_tbl c, lecturer_tbl l 
where lecturer = idx

select id, c.name,credit, l.name, case when week = 1 then '월' when week = 2 then '화' when week = 3 then '수' when week = 4 then '목' when week = 5 then '금' when week = 6 then '토' end as week, to_char(start_hour, 'fm0000') as start_hour, to_char(end_end, 'fm0000') as end_end from course_tbl c, lecturer_tbl l where lecturer = idx 

select name from lecturer_tbl

select  from course_tbl
select id, c.name,credit, l.name, case when week = 1 then '월' when week = 2 then '화' when week = 3 then '수' when week = 4 then '목' when week = 5 then '금' when week = 6 then '토' end as week, start_hour, end_end from course_tbl c, lecturer_tbl l where lecturer = idx

SELECT * FROM v$resource_limit where resource_name='processes'; 

SQL>ALTER SYSTEM SET PROCESSES=200 SCOPE=spfile; 

SQL>shutdown immediate; --셧다운
SQL>startup; --재시작

select id, c.name,credit, l.name, case when week = 1 then '월' when week = 2 then '화' when week = 3 then '수' when week = 4 then '목' when week = 5 then '금' when week = 6 then '토' end as week, to_char(start_hour, 'fm0000'), to_char(end_end, 'fm0000') from course_tbl c, lecturer_tbl l where lecturer = idx
order by  id asc 

create table theater(
	tno number(2) primary key,
	tname varchar2(15),
	location varchar2(15)
)
create table screen(
	tno number(2) primary key,
	sno number(2),
	cno number(2),
	seat number(2),
	rdate date
	
	
)
create table customer2(
	cno number(2) primary key,
	name varchar2(15),
	address varchar2(15)
)






