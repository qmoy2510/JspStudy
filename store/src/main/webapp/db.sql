create table goods_tbl_003(
	--상품코드
	goods_cd varchar2(6) not null primary key,
	--상품명
	goods_nm varchar2(30),
	--단가
	goods_price number(8),
	--원가
	cost number(8),
	--입고일자
	in_date date
)
goods_cd,goods_nm,goods_price,cost,to_char(in_date,'yyyy-mm-dd')

insert into goods_tbl_003 values('110001', '라면', 1050, 750, '20190302');
insert into goods_tbl_003 values('110002', '빵', 1300, 800, '20190302');
insert into goods_tbl_003 values('110003', '과자', 2000, 1700, '20190302');
insert into goods_tbl_003 values('110004', '탄산음료', 900, 750, '20190302');
insert into goods_tbl_003 values('110005', '삼각김밥', 750, 300, '20190302');
insert into goods_tbl_003 values('110006', '초콜릿', 1500, 1300, '20190302');
insert into goods_tbl_003 values('110007', '우유', 850, 600, '20190302');

create table store_tbl_003(
	--점포코드
	store_cd varchar2(5) not null primary key,
	--점포명
	store_nm varchar2(20),
	--직영구분
	store_fg varchar2(1)
)
insert into store_tbl_003 values('A001', '이태원점', '0');
insert into store_tbl_003 values('A002', '한남점', '0');
insert into store_tbl_003 values('A003', '도원점', '0');
insert into store_tbl_003 values('B001', '혜화점', '1');
insert into store_tbl_003 values('C001', '방배점', '1');
insert into store_tbl_003 values('D001', '사당점', '0');
insert into store_tbl_003 values('D002', '흑석점', '1');
insert into store_tbl_003 values('E001', '금호점', '0');

create table sale_tbl_003(
	--판매번호
	sale_no varchar2(4) not null primary key,
	--판매일자
	sale_ymd date not null,
	--판매구분
	sale_fg varchar2(1) not null ,
	--점포코드
	store_cd varchar2(5),
	--상품코드
	goods_cd varchar2(6) ,
	--판매수량
	sale_cnt number(3),
	--수취구분
	pay_type varchar2(3),
	
	foreign key (goods_cd)REFERENCES goods_tbl_003 (goods_cd),
	foreign key (store_cd)REFERENCES store_tbl_003 (store_cd)
)

select store_nm, sum(case when pay_type = '01' then sale_cnt*goods_price else 0 end),sum(case when pay_type = '02' then sale_cnt*goods_price else 0 end),(sum(case when pay_type = '01' then sale_cnt*goods_price else 0 end)+sum(case when pay_type = '02' then sale_cnt*goods_price else 0 end)) from sale_tbl_003 s, goods_tbl_003 g, store_tbl_003 ss where s.goods_cd = g.goods_cd and ss.store_cd = s.store_cd group by store_nm order by 4 desc
select sale_fg, sale_no, to_char(sale_ymd, 'yyyy-mm-dd'), goods_nm, sale_cnt, (sale_cnt*goods_price), pay_type from sale_tbl_003 s, goods_tbl_003 g, store_tbl_003 ss where s.goods_cd = g.goods_cd and ss.store_cd = s.store_cd and store_nm = '이태원점'


insert into sale_tbl_003 values('0001', '20190325', '1', 'A001', '110001', 2, '02');
insert into sale_tbl_003 values('0002', '20190325', '1', 'B001', '110003', 2, '02');
insert into sale_tbl_003 values('0003', '20190325', '1', 'D001', '110003', 1, '01');
insert into sale_tbl_003 values('0004', '20190325', '1', 'A001', '110006', 5, '02');
insert into sale_tbl_003 values('0005', '20190325', '1', 'C001', '110003', 2, '02');
insert into sale_tbl_003 values('0006', '20190325', '2', 'C001', '110003', 2, '02');
insert into sale_tbl_003 values('0007', '20190325', '1', 'A002', '110005', 4, '02');
insert into sale_tbl_003 values('0008', '20190325', '1', 'A003', '110004', 4, '02');
insert into sale_tbl_003 values('0009', '20190325', '1', 'B001', '110001', 2, '01');	
insert into sale_tbl_003 values('0010', '20190325', '1', 'A002', '110006', 1, '02');


 
select goods_cd ,goods_nm from goods_tbl_003
	
create SEQUENCE text2 start with 110009;


drop sequence text;
create SEQUENCE text start with 11;
select to_char(text2.nextval, 'fm000000'), to_char(sysdate,'yyyy-mm-dd') from dual;

select goods_cd, goods_nm, to_char(goods_price, 'l9999,9999,9999'), cost, in_date from goods_tbl_003
