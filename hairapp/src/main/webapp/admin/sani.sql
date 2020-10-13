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




SELECT   d.designer_name,sum(
			 (   SELECT  nvl(sum(mdp_price),0)  
				 FROM members_detail_paylist   
				
				 ))as ammount     	 
FROM  
	members_designer_rsv r   
JOIN designer  d  
 ON (r.designer_no=d.designer_no)
 
 GROUP BY designer_name
 ;

 
 
 
 
 
 
 
SELECT   d.designer_name,sum(
			 (   SELECT  nvl(sum(mdp_price),0)  
				 FROM members_detail_paylist   
				 WHERE mdr_no=r.mdr_no
			 and mdr_date between '20-09-27' and '20-09-29'
				 ))as ammount     	 
FROM  
	members_designer_rsv r   
JOIN designer  d  
 ON (r.designer_no=d.designer_no)
 where d.hs_no = 2 
 GROUP BY designer_name;

 
 
 
        
       
       
    select h.hhi_name,tmac.tmac_name, tmic.tmic_explication ,m.mem_sex,
        count(*),row_number() 
    over ( partition by mem_sex order by count(*)desc) ranking
    from hairshop_hair_info h 
    join mem_designer_rsv_info i on(h.hhi_no = i.hhi_no) 
    join members_designer_rsv r  on(r.mdr_no=i.mdr_no)
    join members m on(r.mem_no=m.mem_no)
    join tt_middle_category tmic on(tmic.tmic_no = h.tmic_no)
     join tt_main_category tmac on(tmac.tmac_no =tmic.tmac_no)
  join (SELECT
    a.*
FROM
    (
        SELECT
            d.designer_name,
            h.hhi_name,
            COUNT(*),
            ROW_NUMBER() OVER(
                PARTITION BY h.hhi_name
                ORDER BY
                    COUNT(*) DESC
            ) ranking
        FROM
            hairshop_hair_info      h
            JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )
            JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )
            JOIN designer                d ON ( d.designer_no = r.designer_no )
        GROUP BY
            h.hhi_name,
            d.designer_name
    ) a
WHERE
    a.ranking < 2;
    )  d on(d.hhi_name=h.hhi_name)
     

   left outer join hairshop_reviews rv on(rv.mdr_no=r.mdr_no)

   -- where m.mem_sex= 'female'  
    group by h.hhi_name,tmac.tmac_name, tmic.tmic_explication, m.mem_sex
    --, d.designer_name
    
    ;
    
  
 
 
 
 
 
 
SELECT
       



SELECT
    a.*
FROM
    (
        SELECT
            d.designer_name,
            h.hhi_name,
            COUNT(*),
            ROW_NUMBER() OVER(
                PARTITION BY h.hhi_name
                ORDER BY
                    COUNT(*) DESC
            ) ranking
        FROM
            hairshop_hair_info      h
            JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )
            JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )
            JOIN designer                d ON ( d.designer_no = r.designer_no )
        GROUP BY
            h.hhi_name,
            d.designer_name
    ) a
WHERE
    a.ranking < 2;
    
       
    
    
    
    
    
    
    
    
    
    
    SELECT
    d.designer_name,
    sum
(
( SELECT
    mdp_price
FROM
    members_detail_paylist
WHERE ) ) as cnt,
          RANK() OVER(
              ORDER BY
                  SUM(p.mdp_price) DESC
          ) AS rank
FROM
    designer                 d
    JOIN members_designer_rsv     r ON ( d.designer_no = r.designer_no )
    JOIN members_detail_paylist   p ON ( r.mdr_no = p.mdr_no )
--where d.hs_no = 2
GROUP BY
    d.designer_name,
    mdp_price;

SELECT
    *
FROM
    designer                 d
    JOIN members_designer_rsv     r ON ( d.designer_no = r.designer_no )
    JOIN members_detail_paylist   p ON ( r.mdr_no = p.mdr_no )
WHERE
    d.hs_no = 2;

SELECT
    d.designer_name,
   nvl( AVG((
        SELECT
            AVG(hr_rate)
        FROM
            hairshop_reviews
        WHERE
            mdr_no = r.mdr_no
    )), 0) AS rate,
    RANK() OVER(
        ORDER BY
            nvl(AVG((
                SELECT
                    AVG(hr_rate)
                FROM
                    hairshop_reviews
                WHERE
                    mdr_no = r.mdr_no
            )), 0) DESC
    ) AS rank
FROM
    members_designer_rsv   r
    JOIN designer               d ON ( r.designer_no = d.designer_no )
WHERE
    r.hs_no = 2
GROUP BY
    d.designer_name;

SELECT
    *
FROM
    hairshop_reviews;
