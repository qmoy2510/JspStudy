create table tbl_candidate_01(
	--후보번호
	c_id number(3) primary key,
	--학번
	s_no varchar2(5),
	--성명
	s_name varchar2(20),
	--성별
	s_gender varchar2 (1)
)
insert into TBL_CANDIDATE_01 values(1, '20300', '홍길동', '0');
insert into TBL_CANDIDATE_01 values(2, '20400', '고길동', '1');

