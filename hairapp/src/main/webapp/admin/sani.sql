INSERT
INTO hairshop(
HS_NO,
HS_NAME,
HS_OWNER,
HS_TEL,
HS_EMAIL,
HS_PW,
HS_COMP_NO,
HS_PROFILE,
HS_NOTICE,
HS_FULLADDR,
HS_CITYADDR,
HS_TOWNADDR,
HS_STREETADDR,
HS_LATLONG,

HS_STARTTIME,
HS_ENDTIME,
HS_RESOURCE_OPTION,
HS_PARKING,

HS_APPROVAL)
	VALUES
	(
HS_NO,
'&HS_NAME',
'&HS_OWNER',
'&HS_TEL',
'&HS_EMAIL',
'&HS_PW',
'&HS_COMP_NO',
'&HS_PROFILE',
'&HS_NOTICE',
'&HS_FULLADDR',
'&HS_CITYADDR',
'&HS_TOWNADDR',
'&HS_STREETADDR',
'&HS_LATLONG',

'&HS_STARTTIME',
'&HS_ENDTIME',
'&HS_RESOURCE_OPTION',
'&HS_PARKING',

'&HS_APPROVAL'
	);
	
	
	
	
	
	
	
	
	select *from qna q   where 

(select count(qna_no) from qna  where qna_ref=q.qna_no 
)  >1 and qna_category!='m5'order by 1;





create sequence qna_no_seq start with 65;


create sequence code_no_seq start with 6;
insert into code values(1000,'0J','사용자구분','j1','미용실');
insert into code values(1001,'0J','사용자구분','j2','일반회원');
insert into code values(1002,'0J','사용자구분','j3','디자이너');
insert into code values(1003,'0M','members qna','m1','예약 관련 문의');
insert into code values(1004,'0M','members qna','m2','사이트 관련 문의');
insert into code values(1005,'0M','members qna','m3','이벤트 관련 문의');
insert into code values(1006,'0M','members qna','m4','고객의 소리');
insert into code values(1007,'0M','members qna','m5','답변');

insert into code values(1008,'0R','qna 답변여부','1','답변완료');
insert into code values(1009,'0R','qna 답변여부','0','미답변');
commit;

select c.code_info "a", distinct q.qna_no
from qna q , code c 

where c.secondary_code = q.qna_who 
or c.secondary_code = q.qna_category
;

select qna_who,
            (select c.code_info 
            from code c
            where c.secondary_code=q.qna_who)"qna_whov",
            (select z.code_info from code z where z.secondary_code=q.qna_category)"qna_categoryv"
            ,(select 
from qna q ;

select * from qna where qna_no <>qna_ref;
INSERT INTO qna(qna_no, qna_title, qna_contents, qna_writedate, qna_openstatus, qna_hits, qna_category, 
qna_who, emp_no, qna_ref, qna_repos, qna_level, qna_writer) 
VALUES(qna_no_seq.NEXTVAL, 'title', 'contents', sysdate, 1, 0, 'm5', 'j2', '50', '13', '1', '1', '관리자');

commit;
