create table member_tbl_001
(
	cust_no number(6) not null primary key,
	cust_name varchar2(20) not null ,
	phone varchar2(13) not null,
	address varchar2(60),	
	joindate date,
	stat_fg varchar2(2)
)
UPDATE member_tbl_001 SET cust_name = ?, phone = ?, address = ?, joindate = ?, stat_fg = ? WHERE cust_no = ?
insert into member_tbl_001
values
(100001, '김유정', '010-1111-2222', '서울 용산구', '20180501', '0');
insert into member_tbl_001 values (100002, '김윤경', '010-2222-3333', '서울 동작구', '20180822', '0');
insert into member_tbl_001
values
(100003, '최승필', '010-3333-4444', '서울 강남구', '20180913', '1');
insert into member_tbl_001
values
(100004, '강지현', '010-4444-5555', '서울 송파구', '20181107', '1');
insert into member_tbl_001
values
(100005, '인원석', '010-5555-6666', '서울 성동구', '20180108', '0');
insert into member_tbl_001
values
(100006, '김승현', '010-6666-7777', '서울 광진구', '20180117', '0');

create table book_tbl_001
(
	book_code varchar2(10) not null primary key,
	book_name varchar2(50) not null ,
	book_type varchar2(2),
	book_author varchar2(20),	
	in_date date,
	stat_fg varchar2(2)
);
insert into book_tbl_001
values
('A0001', '언어의 온도', 'A', '이기주', '20180501', '1');
insert into book_tbl_001
values
('A0002', '골든 아워', 'A', '이국종', '20180501', '1');
insert into book_tbl_001
values
('B0001', '12가지 인생의 법칙', 'B', '피터슨', '20180601', '1');
insert into book_tbl_001
values
('B0002', '당신이 옳다', 'B', '정혜신', '20180601', '0');
insert into book_tbl_001
values
('C0001', '마력의 태동', 'C', '양윤옥', '20180901', '1');
insert into book_tbl_001
values
('C0002', '꽃을 보듯 너를 본다', 'C', '나태주', '20180901', '1');

drop table rental_tbl_001

create table rental_tbl_001
(
	rent_ymd varchar2(8) not null, --대여일자
	rent_no varchar2(5) not null,--대여번호
	rent_book varchar2(10) not null,--대여도서코드
	rent_rent number(6) not null,	--대여고객번호
	close_ymd varchar2(8) not null,--반남기한
	return_ymd varchar2(8),--반납일
	return_fg varchar2(2),--반납여부
	primary key(rent_ymd,rent_no)
);
insert into rental_tbl_001
values
('20190318', '00001', 'A0001', 100001, '20190325', null, '0');
insert into rental_tbl_001
values
('20190318', '00002', 'B0001', 100001, '20190325', null, '0');
insert into rental_tbl_001
values
('20190318', '00003', 'C0001', 100001, '20190325', null, '0');
insert into rental_tbl_001
values
('20190320', '00001', 'B0001', 100005, '20190327', null, '0');
insert into rental_tbl_001
values
('20190322', '00001', 'A0001', 100006, '20190329', '20190324', '1');
insert into rental_tbl_001
values
('20190323', '00001', 'C0001', 100003, '20190330', null, '0');

select *
from rental_tbl_001

SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') as s, TO_CHAR(SYSDATE, 'YYYYMMDD')+7 as ss, TO_Char(nvl(max(rent_no),0)+1, 'FM00000') as rentNo FROM rental_tbl_001
insert into member_tbl_02 
values ((TO_CHAR(SYSDATE, 'YYYYMMDD')),(select TO_Char(nvl(max(rent_no),0)+1, 'FM00000') from rental_tbl_001),?,?,(TO_CHAR(SYSDATE, 'YYYYMMDD')+7), null, null)
INSERT INTO member_tbl_02 VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), (SELECT TO_CHAR(NVL(MAX(rent_no), 0) + 1, 'FM00000') FROM rental_tbl_001), ?, ?, TO_CHAR(SYSDATE + 7, 'YYYYMMDD'), NULL, NULL);

INSERT INTO member_tbl_02 VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD'), (SELECT TO_CHAR(NVL(MAX(rent_no), 0) + 1, 'FM00000') FROM rental_tbl_001), 13, 13, TO_CHAR(SYSDATE + 7, 'YYYYMMDD'), NULL, NULL)


select cust_no,cust_name,phone,address,	joindate, case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면' when stat_fg = 0 then '탈퇴' end as stat_fg from member_tbl_001

select 
,  , ?, ?, , NULL, NULL)
(,, 'C0001', 100003, , null, '0')


select  cust_no,cust_name,phone,address,	joindate, case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면' when stat_fg = 0 then '탈퇴' end as stat_fg from member_tbl_001
select substr(book_code,1,1), to_char(max(substr(book_code, 2, 4))+1, '0000'), sysdate from book_tbl_001 group by substr(book_code,1,1)
select substr(book_code,1,1), to_char(max(substr(book_code, 2, 4))+1, '0000'), sysdate from book_tbl_001 group by substr(book_code,1,1)

select cust_no,cust_name,phone,addreㅋㅋㅋㅋㅋㅋss,	joindate, case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면' when stat_fg = 0 then '탈퇴' end as stat_fg from member_tbl_001

select (nvl(max(cust_no), 10000)+1),to_char(sysdate,'YYYY-MM-DD') as sysdate 
from member_tbl_001 
group by to_char(sysdate,'YYYY-MM-DD') 

select cust_no,cust_name,phone,address,	to_char(joindate, 'yyyy-mm-dd') as joindate, case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면' when stat_fg = 0 then '탈퇴' end as stat_fg from member_tbl_001

select book_code,book_name,book_type,book_author,	to_char(in_date, 'yyyy-mm-dd') as in_date, case when stat_fg = 0 then '대여가능' when stat_fg = 1 then '대여중' end as stat_fg from book_tbl_001

insert into book_tbl_001 values('A0001', '언어의 온도', 'A', '이기주', '20180501', '1');

select rent_ymd, rent_no, rent_book, book_name, rent_rent, cust_name, return_ymd from member_tbl_001, RENTAL_TBL_001, book_tbl_001 where book_code = rent_book and rent_rent = cust_no order by rent_ymd, rent_no, rent_book asc

select nvl(max(cust_no), 10000)+1 as cust_no, to_char(sysdate, 'yyyy_mm_dd') from MEMBER_TBL_001 

select nvl(max(cust_no), 10000)+1 as cust_no, to_char(sysdate, 'yyyy_mm_dd') as to_char from MEMBER_TBL_001

select nvl(max(cust_no), 10000)+1 as cust_no, to_char(sysdate, 'yyyy_mm_dd') as to_char from MEMBER_TBL_001

select * from MEMBER_TBL_001 where cust_no = ?;

select * from book_tbl_001 where book_code = 'B0002'