create table tbl_pizza_01(
	--피자 코드
	pcode char(4) primary key,
	--피자명
	pname varchar2(30),
	--단가
	cost number(7)
)
insert into tbl_pizza_01 values('AA01', '고르골졸라피자', 6000);
insert into tbl_pizza_01 values('AA02', '치즈피자', 6500);
insert into tbl_pizza_01 values('AA03', '페퍼로니피자', 7000);
insert into tbl_pizza_01 values('AA04', '콤비네이션피자', 7500);
insert into tbl_pizza_01 values('AA05', '고구마피자', 6000);
insert into tbl_pizza_01 values('AA06', '포테이토피자', 7000);
insert into tbl_pizza_01 values('AA07', '불고기피자', 8000);
insert into tbl_pizza_01 values('AA08', '나폴리피자', 8000);

create table tbl_shop_01(
	--지점코드
	scode char(4) primary key,
	--지점상호
	sname varchar(20)
)
insert into tbl_shop_01 values('S001', '강남점');
insert into tbl_shop_01 values('S002', '강서점');
insert into tbl_shop_01 values('S003', '강동점');
insert into tbl_shop_01 values('S004', '영동점');
insert into tbl_shop_01 values('S005', '시청점');
insert into tbl_shop_01 values('S006', '인천점');


create table tbl_salelist_01(
	--매출전표번호
	saleno number(7) primary key,
	--지점코드
	scode char(4),
	foreign key (scode) references tbl_shop_01(scode), 
	--판매일자
	saledate date,
	--피자코드
	pcode char(4),
	foreign key (pcode) references tbl_pizza_01(pcode), 
	--판매수량
	amount number(5)
)
insert into tbl_salelist_01	values(100001, 'S001', '2018-12-02', 'AA01', 50);
insert into tbl_salelist_01 values(100002, 'S001', '2018-12-02', 'AA02', 30);
insert into tbl_salelist_01 values(100003, 'S001', '2018-12-02', 'AA03', 20);
insert into tbl_salelist_01 values(100004, 'S001', '2018-12-02', 'AA04', 50);
insert into tbl_salelist_01 values(100005, 'S003', '2018-12-03', 'AA01', 40);
insert into tbl_salelist_01 values(100006, 'S003', '2018-12-03', 'AA02', 60);
insert into tbl_salelist_01 values(100007, 'S003', '2018-12-03', 'AA04', 60);
insert into tbl_salelist_01 values(100008, 'S003', '2018-12-04', 'AA05', 70);
insert into tbl_salelist_01 values(100009, 'S005', '2018-12-02', 'AA01', 80);
insert into tbl_salelist_01 values(100010, 'S005', '2018-12-02', 'AA03', 30);
insert into tbl_salelist_01 values(100011, 'S005', '2018-12-02', 'AA04', 40);
insert into tbl_salelist_01 values(100012, 'S005', '2018-12-02', 'AA05', 50);
insert into tbl_salelist_01 values(100013, 'S005', '2018-12-04', 'AA01', 30);
insert into tbl_salelist_01 values(100014, 'S004', '2018-12-04', 'AA02', 20);
insert into tbl_salelist_01 values(100015, 'S004', '2018-12-04', 'AA06', 50);

select saleno, l.scode, sname, to_char(saledate, 'yyyy-mm-dd'), l.pcode, pname, amount,to_char((cost*amount), 'l999,999,999') from tbl_salelist_01 l, tbl_shop_01 s, tbl_pizza_01 p where l.scode = s.scode and l.pcode = p.pcode
select l.scode,saleno, sum((cost*amount)) from (select l.scode,(cost*amount) from tbl_salelist_01 l, tbl_shop_01 s, tbl_pizza_01 p where l.scode = s.scode and l.pcode = p.pcode) group by l.scode,saleno

select l.pcode, pname, sum((cost*amount)) from tbl_salelist_01 l, tbl_pizza_01 p  where l.pcode = p.pcode group by l.pcode, pname order by 3 desc
