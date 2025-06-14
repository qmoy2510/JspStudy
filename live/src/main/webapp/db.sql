create table member_tbl_001(
	--회원 번호
	cust_no number(6) not null primary key,
	--회원 성명
	cust_name varchar2(20) not null,
	--핸드폰 번호
	phone varchar2(13) not null,
	--주소
	address varchar2(60),
	--가입 일자
	join_date date,
	--상태구분
	stat_fg varchar2(2)
)
cust_no ,cust_name,phone ,address ,to_char(join_date,'yyyy-mm-dd') ,stat_fg 

insert into MEMBER_TBL_001 values(100001, '김유정', '010-1111-2222', '서울 용산구', '20180501', '0');
insert into MEMBER_TBL_001 values(100002, '김윤경', '010-2222-3333', '서울 동작구', '20180822', '0');
insert into MEMBER_TBL_001 values(100003, '최승필', '010-3333-4444', '서울 강남구', '20180913', '1');
insert into MEMBER_TBL_001 values(100004, '강지현', '010-4444-5555', '서울 송파구', '20181107', '1');
insert into MEMBER_TBL_001 values(100005, '이원석', '010-5555-6666', '서울 성동구', '20180108', '0');
insert into MEMBER_TBL_001 values(100006, '김승현', '010-6666-7777', '서울 광진구', '20180111', '0');

create table book_tbl_001(
	--도서코드
	book_code varchar2(10) not null primary key,
	--도서명
	book_name varchar2(50) not null,
	--장르
	book_type varchar2(2),
	--작가
	book_author varchar2(20),
	--입고일자
	in_date date,
	--도서상태
	stat_fg varchar2(2)
)


insert into book_tbl_001 values('A0001', '언어의 온도', 'A', '이기주', '20180501', '1');
insert into book_tbl_001 values('A0002', '골든아워', 'A', '이국종', '20180501', '1');
insert into book_tbl_001 values('B0001', '12가지 인생의 법칙', 'B', '피터슨', '20180601', '1');
insert into book_tbl_001 values('B0002', '당신이 옳다', 'B', '정혜인', '20180601', '0');
insert into book_tbl_001 values('C0001', '마력의 태동', 'C', '양윤옥', '20180901', '1');
insert into book_tbl_001 values('C0002', '꽃을 보듯 너를 본다', 'C', '나태주', '20180901', '1');

select * from book_tbl_001

create table rental_tbl_001(
	--대여일자
	rent_ymd varchar2(8) not null,
	--대여번호
	rent_no varchar2(5) not null,
	--대여도서코드
	rent_book varchar2(10) not null,
	--대여고객번호
	rent_rent number(6) not null,
	--반납기한
	close_ymd varchar2(8) not null,
	--반납일
	return_ymd varchar2(8),
	--반납여부
	return_fg varchar2(2)	,
	primary key(rent_ymd, rent_no)
)
insert into rental_tbl_001 values('20190318', '00001', 'A0001',100001, '20190325', null, '0');
insert into rental_tbl_001 values('20190318', '00002', 'B0001',100001, '20190325', null, '0');
insert into rental_tbl_001 values('20190318', '00003', 'C0001',100001, '20190325', null, '0');
insert into rental_tbl_001 values('20190320', '00001', 'B0002',100005, '20190327', null, '0');
insert into rental_tbl_001 values('20190322', '00001', 'A0002',100006, '20190329', '20190324', '1');
insert into rental_tbl_001 values('20190323', '00001', 'C0002',100003, '20190330', null, '0');

select to_char(sysdate,'yyyymmdd'), to_char(nvl(max(rent_no), 00000)+1, 'fm00000'), to_char(sysdate,'yyyymmdd')+7 from rental_tbl_001 where rent_ymd = to_char(sysdate,'yyyymmdd')

select to_char(sysdate,'yyyymmdd'), to_char(nvl(max(rent_no), 00000)+1, 'fm00000'), to_char(sysdate,'yyyymmdd')+7 from rental_tbl_001 where rent_ymd = to_char(sysdate,'yyyymmdd')
select * from rental_tbl_001

select cust_no, cust_name, phone, address, to_char(join_date, 'yyyy-mm-dd'), case when stat_fg = 0 then '정상' when stat_fg = 1 then '휴면' end from member_tbl_001

select book_code, book_name, book_type, book_author, to_char(in_date,'yyyy-mm-dd'), case when stat_fg = '0' then '대여가능' when stat_fg = '1' then '대여중' end from book_tbl_001

select rent_ymd, rent_no, rent_book, book_name, rent_rent, cust_name, close_ymd from book_tbl_001 b, rental_tbl_001 r, member_tbl_001 m where rent_rent = cust_no and book_code = rent_book order by rent_ymd, rent_no, rent_book asc

select nvl(max(cust_no), 10000)+1, to_char(sysdate, 'yyyy-mm-dd') from member_tbl_001

select * from MEMBER_TBL_001 where cust_no