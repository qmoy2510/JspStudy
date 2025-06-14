create table member_tbl
(
	--학번
	id varchar2(5) not null primary key,
	--이름
	name varchar2(20),
	--성별
	gender varchar2(3)
)
create table score_tbl
(
--학번
	id varchar2(5) not null primary key,
--국어
	korean number(3),
--영어
	english number(3),
--수학
	math number(3),
--역사
	history number(3)
)
select * from member_tbl
select * from score_tbl

insert into MEMBER_TBL values('10301', '권기현', '남');
insert into MEMBER_TBL values('10302', '구지우', '여');
insert into MEMBER_TBL values('10303', '권태준', '남');
insert into MEMBER_TBL values('10304', '금기연', '여');
insert into MEMBER_TBL values('10305', '김영진', '남');
insert into MEMBER_TBL values('10401', '김주현', '남');
insert into MEMBER_TBL vaalues('10402', '김태민', '여');
insert into MEMBER_TBL values('10403', '임수민', '여');
insert into MEMBER_TBL values('10404', '남상도', '남');
insert into MEMBER_TBL values('10405', '조은호', '여');

insert into score_tbl values('10301', 70, 80,75,95);
insert into score_tbl values('10302', 80, 73,80,85);
insert into score_tbl values('10303', 45, 75,45,75);
insert into score_tbl values('10304', 65, 73,65,65);
insert into score_tbl values('10305', 90, 100,68,95);
insert into score_tbl values('10401', 95, 75,84,60);
insert into score_tbl values('10402', 65, 70,50,94);
insert into score_tbl values('10403', 80, 60,100,80);
insert into score_tbl values('10404', 64, 50,40,65);
insert into score_tbl values('10405', 55, 70,80,75);

select m.id, m.name,substr(m.id, 1, 1), substr(m.id, 2, 2), substr(m.id, 4, 2), m.gender, s.korean, s.english, s.math, s.history,(s.korean + s.english +s.math +s.history) as sum, (s.korean + s.english +s.math +s.history)/4 as avg,RANK() OVER(ORDER BY (s.korean + s.english +s.math +s.history) asc) rank from member_tbl m, score_tbl s where m.id = s.id;


