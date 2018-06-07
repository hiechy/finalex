create table free(
l_Id varchar2(50) references library(l_id),
f_Title varchar2(20),
f_Content varchar2(1000),
f_m_Id varchar2(50) references lib_member(m_id),
f_Pw varchar2(20),
f_Date date,
f_Num Number(20) primary key
);

create table library(
l_Id varchar2(50) primary key,
l_Name varchar2(50),
l_Address varchar2(100),
l_Time varchar2(100),
l_latitude number(10,6),       --위도
l_longtitude number(10,6)      --경도 
);

create table lib_member(
l_Id varchar2(50) references library(l_id),
m_Id varchar2(50) primary key,
Pw varchar2(50),
Phone varchar2(50),
m_Name varchar2(50),
m_Pic varchar2(30)    --회원 아바타
);
--70.12.109.113  prj_library / library
--자유게시판 리플
create table freereply(
fr_num Number(10) primary key,
fr_free_num Number(20) references free(f_num),
fr_m_Id varchar2(50) references lib_member(m_id),
fr_content varchar2(100),
m_Pic varchar2(30),
fr_Pw varchar2(30)
);


37.524072  126.980492 --국중박
37.497851, 127.003702 --국중도
alter table library add(l_latitude number(10,6),l_longtitude number(10,6));--위도 경도 추가
alter table lib_member add(m_Pic varchar2(30));
alter table freereply add(m_Pic varchar2(30));
update library set l_longtitude=127.003702;

update lib_member  set m_Pic = 'person2.jpg' where m_Id='Lee';
update freereply set m_Pic = 'person2.jpg' where fr_m_Id='Lee';
--리플 테이블과 멤버 테이블에 m_pic 칼럼 추가
------------------------------------------------------------------------------
insert into library 
values('1','국립중앙도서관','서울 서초구 반포대로 201 국립중앙도서관','09:00~18:00');
insert into library 
values('2','국회도서관','서울특별시 영등포구 의사당대로 1 (여의도동) (우07233)','09:00~18:00',37.531149,126.917182);

insert into lib_member values('1','kim','kim','010-1111-2222','Tomas','person1.jpg');
insert into lib_member values('1','Lee','Lee','010-2222-3333','Jhon','person2.jpg');
insert into lib_member values('1','Choi','Choi','010-3333-4444','Json','person3.jpg');
insert into lib_member values('1','Park','Park','010-4444-5555','G-Dragon','person4.jpg');
select * from library;
select * from freereply;
select * from free;
select * from lib_member;

insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,1);
insert into free values('1','Hi','???hello???','Lee','12',sysdate,2);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,3);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,4);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,5);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,6);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,7);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,8);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,9);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,10);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,11);
insert into free values('1','good','gooooooooooooooooooood','kim','12',sysdate,12);
insert into free values('1','Park','oooo','Park',?,sysdate,(select nvl(max(f_num),0) from free)+1);

select * from
(select  rownum rm , e.* 
from(select * from free order by f_date desc)e)where rm between 1 and 2;

select count(*) from free;
(select nvl(max(f_num),0) from free)+1;

select * from
(select  rownum rm , e.* 
from(select * from free where l_Id ='1' and  sysdate-f_date<1
order by f_date desc)e)where rm between 1 and 10;



select * from
(select  rownum rm , e.* 
from(select * from free where l_Id = 1
and f_m_Id like '%Lee%')e);

insert into freereply values('1','19','kim','감격 ㅠㅠ','person1.jpg','12');
insert into freereply values('2','19','kim','리얼 ㅠㅠ','person1.jpg','12');
insert into freereply values('3','20','Lee','ㅋㅋㅋ ','person2.jpg','12');
insert into freereply values('4','20','Choi','ㅋㅋㅋㅋㅋ ','person3.jpg','12');
insert into freereply values('5','20','Park','ㅋㅋㅋㅋㅋㅋㅋ ','person4.jpg','12');
insert into freereply values('6','20','kim','ㅋㅋㅋㅋㅋㅋㅋㅋㅋ ','person1.jpg','12');
insert into freereply values('7','19','Park','ㅊㅋㅊㅋ','person4.jpg','12');

insert into freereply values((select nvl(max(fr_num),0) from freereply)+1,
'23','kim','ooo',(select m_Pic from lib_member where m_Id='kim'),'12');

select m_Pic from lib_member where m_Id='kim';
(select nvl(max(fr_num),0) from freereply)+1;
select nvl(max(fr_num),0) from freereply;

SELECT * FROM freereply where fr_num='19';

select m_Pic, e.* from lib_member l,
(SELECT * FROM freereply where fr_num=19)e where l.m_Id=e.fr_m_Id;
select * from library where l_id='1';