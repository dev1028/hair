----------------회원예약
INSERT
INTO members_designer_rsv
	(
		mdr_no,
		mdr_date,
		mem_no,
		hs_no,
		designer_no,
		mdr_status,
		mdr_category_code,
		mdr_online_price
	)
	VALUES
	(
		&mdr_no,
		'&mdr_date',
		&mem_no,
		&hs_no,
		&designer_no,
		'&mdr_status',
		'&mdr_category_code',
		&mdr_online_price
	);
	
	SELECT *
FROM members_designer_rsv;
DESC members_designer_rsv;
SELECT *
FROM DESIGNER;
SELECT *
FROM employees;