create table member_tbl_02(
	custno		number(6)	primary key,
	custname	varchar2(20),
	phone	varchar2(13),
	address	varchar2(60),
	joindate date,
	grade char(1),
	city char(2)
);
--﻿drop table money_tbl_02
create table money_tbl_02(
	custno number(6),
	salenol number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,
	primary key(custno, salenol)
);

insert all
into member_tbl_02
values (100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01')
into member_tbl_02
values (100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01')
into member_tbl_02
values (100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30')
into member_tbl_02
values (100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30')
into member_tbl_02
values (100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60')
into member_tbl_02
values (100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60')

into money_tbl_02
values (100001, 20160001, 500, 5, 2500, 'A001', '20160101')
into money_tbl_02
values (100001, 20160002, 1000, 4, 2500, 'A002', '20160101')
into money_tbl_02
values (100001, 20160003, 500, 3, 2500, 'A008', '20160101')
into money_tbl_02
values (100002, 20160004, 2000, 1, 2500, 'A004', '20160102')
into money_tbl_02
values (100002, 20160005, 500, 1, 2500, 'A001', '20160103')
into money_tbl_02
values (100003, 20160006, 1500, 2, 2500, 'A003', '20160103')
into money_tbl_02
values (100004, 20160007, 500, 2, 2500, 'A001', '20160104')
into money_tbl_02
values (100004, 20160008, 300, 1, 2500, 'A005', '20160104')
into money_tbl_02
values (100004, 20160009, 600, 1, 2500, 'A006', '20160104')
into money_tbl_02
values (100004, 20160010, 3000, 1, 2500, 'A007', '20160106')
select * from dual;

select * from member_tbl_02;

select * from money_tbl_02;

select * from member_tbl_02

select nvl(max(custno), 10000) + 1 custno from member_tbl_02
insert into member_tbl_02 values (select nvl (max (custno), 10000) + 1 from member_tbl_02),?,?,?, ?, 12)
insert into member_tbl_02 values ((select nvl (max (custno), 100000) + 1 from member_tbl_02),?,?,?,?,?,?)
select * from member_tbl_02 where custno = 100001 

select me.custno, custname, Case grade when A then VIP when B then 일반 when c then 직원, sum(price) price from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno, custname, grade  order by 4 desc
update member_tbl_02 set custname = ?, phone = ?, address =?, joindate = ?, grade = ?, city = ? where custno = ?
