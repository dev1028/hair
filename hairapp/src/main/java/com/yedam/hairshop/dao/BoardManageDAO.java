package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.BoardManageVo;

public class BoardManageDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static BoardManageDAO instance = null;
	final static String end =

			" order by QNA_REF desc, QNA_REPOS asc, QNA_WRITEDATE desc" + " ) b) a where rn between 0 and 100";
	final static String noticeFind = "select n.* ," + "            (select c.code_info \n" + "            from code c\n"
			+ "            where c.secondary_code=n.notice_who)\"notice_whov\"\n" + " FROM notice n \r\n"
			+ "WHERE  notice_writedate BETWEEN ? AND ?\r\n" + " AND notice_who like'%'||?||'%'\n";

	final static String notice_who = "AND NOTICE_who like'%'||?||'%' ";
	final static String notice_title = "and notice_title like '%'||?||'%' ";
	final static String notice_contents = "and notice_contents like '%'||?||'%' ";
	final static String qna_title = "and qna_title like '%'||?||'%' ";
	final static String qna_contents = "and qna_contents like '%'||?||'%' ";
	final static String emp_no = "and emp_no like '%'||?||'%' ";
	final static String qnaFind = "select a.* from (select rownum rn,b.* from ("
			+ "select QNA_NO	,QNA_SHOP_CUSTOMER_NO	,QNA_TITLE	,QNA_CONTENTS	,QNA_WRITEDATE	,QNA_OPENSTATUS	,QNA_HITS,QNA_CATEGORY ,EMP_NO ,QNA_WHO ,QNA_REF,QNA_REPOS,QNA_LEVEL,QNA_WRITER ,\n"
			+ "            (select c.code_info \n" + "            from code c\n"
			+ "            where c.secondary_code=q.qna_who)\"qna_whov\",\n"
			+ "            (select z.code_info from code z where z.secondary_code=q.qna_category)\"qna_categoryv\",\n"
			+ "(select count(qna_no) from qna r where qna_ref=q.qna_no) as answerComplete " + "from qna q "
			+ "WHERE qna_writedate BETWEEN?AND?\n" + "AND qna_who like'%'||?||'%'\n"
			+ "and qna_category like'%'||?||'%'";

	final static String exclude_ans = " and qna_no = qna_ref ";
	final static String uncomplete_ans = " and  (select count(qna_no) from qna  where qna_ref=q.qna_no \n"
			+ ")  <2 and qna_category!='m5' ";

	final static String complete_ans = " and  (select count(qna_no) from qna  where qna_ref=q.qna_no \n"
			+ ")  >1 and qna_category!='m5' ";
	final static String qnaSelectOne = "select QNA_NO	,QNA_SHOP_CUSTOMER_NO	,QNA_TITLE	,QNA_CONTENTS	,QNA_WRITEDATE	,QNA_OPENSTATUS	,QNA_HITS,QNA_CATEGORY ,EMP_NO ,QNA_WHO ,QNA_REF,QNA_REPOS,QNA_LEVEL,QNA_WRITER ,\n"
			+ "            (select c.code_info \n" + "            from code c\n"
			+ "            where c.secondary_code=q.qna_who)\"qna_whov\",\n"
			+ "            (select z.code_info from code z where z.secondary_code=q.qna_category)\"qna_categoryv\"\n"
			+ ", (select count(qna_no) from qna r where qna_ref=q.qna_no) as answerComplete " + "from qna q "
			+ "WHERE qna_no=?";
	final static String noticeSelectOne = "select n.* ," + "            (select c.code_info \n"
			+ "            from code c\n" + "            where c.secondary_code=n.notice_who)\"notice_whov\"\n"
			+ " FROM notice n \r\n" + "WHERE notice_no=?";

	public static BoardManageDAO getInstance() {
		if (instance == null)
			instance = new BoardManageDAO();
		return instance;
	}

	public int insertAnswer(BoardManageVo vo) {
		System.out.println(vo.emp_no);
		System.out.println(vo.getQna_ref());
		System.out.println(vo.getQna_repos());
		System.out.println(vo.getQna_level());
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO qna(qna_no, qna_title, qna_contents,"
					+ " qna_writedate, qna_openstatus, qna_hits, qna_category,"
					+ " qna_who, emp_no, qna_ref, qna_repos, qna_level, qna_writer)"
					+ " VALUES(qna_no_seq.NEXTVAL, ?, ?, sysdate, 1, 0, 'm5'," + " ?, ?, ?, ?, ?, '관리자')";

			// 시퀀스 값을 글번호와 그룹번호로 사용
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQna_title());
			pstmt.setString(2, vo.getQna_contents());
			pstmt.setString(3, vo.getQna_who());
			pstmt.setString(4, vo.getEmp_no());

			pstmt.setString(5, vo.getQna_ref());
			pstmt.setString(6, vo.getQna_repos());
			pstmt.setString(7, vo.getQna_level());

			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	public boolean updateRePos(BoardManageVo vo) {
		boolean result = false;

		String ref = vo.getQna_ref(); // 원본글 번호(그룹번호)
		String repos = vo.getQna_repos(); // 답변글의 순서

		try {
			conn = ConnectionManager.getConnnect();

			// ref(그룹번호)와 repos(답글순서)을 확인하여 원본 글에 다른 답변 글이 있으면,
			// 답변 글 중 답변 글보다 상위에 있는 글의 seq보다 높은 글의 seq값을 1씩 증가시킨다.
			String sql = "update qna set qna_repos = qna_repos+1 " + " where qna_ref = ? and qna_repos > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ref);
			pstmt.setString(2, repos);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return result;
	}

	public BoardManageVo qnaSelectOne(BoardManageVo vo) {
		String sql = qnaSelectOne;
		BoardManageVo resultVo = new BoardManageVo();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getQna_no());

			rs = pstmt.executeQuery();
			System.out.println("nqnasql");

			while (rs.next()) {

//				System.out.println(rs.getString("qna_no"));
				resultVo.setQna_contents(rs.getString("qna_contents"));
				resultVo.setQna_no(rs.getString("qna_no"));
				resultVo.setQna_title(rs.getString("qna_title"));
				resultVo.setQna_writedate(rs.getString("qna_writedate"));
				resultVo.setQna_shop_customer_no(rs.getString("qna_shop_customer_no"));
				resultVo.setQna_hits(rs.getString("qna_hits"));
				resultVo.setQna_ref(rs.getString("qna_ref"));
				resultVo.setQna_repos(rs.getString("qna_repos"));
				resultVo.setQna_level(rs.getString("qna_level"));
				resultVo.setQna_who(rs.getString("qna_who"));
				resultVo.setQna_whov(rs.getString("qna_whov"));
				resultVo.setQna_category(rs.getString("qna_category"));
				resultVo.setQna_categoryv(rs.getString("qna_categoryv"));

				resultVo.setExcludeAnswer(rs.getString("answerComplete"));
				if (!(resultVo.getQna_no().equals(resultVo.getQna_ref()))) {
					resultVo.setAnswerStatus("-");
				}
				if (Integer.parseInt(resultVo.getExcludeAnswer()) > 1) {
					resultVo.setAnswerStatus("답변완료");
				} else {
					resultVo.setAnswerStatus("미답변");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return resultVo;
	}
	public int insertNotice(BoardManageVo vo) {
		System.out.println(vo.emp_no);
		
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO notice(notice_no, notice_title, notice_contents,"
					+ " notice_writedate, notice_hits, notice_who, "
					+ " emp_no)"
					+ " VALUES(notice_no_seq.NEXTVAL, ?, ?, sysdate, 0, ?, ?)";

			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_title());
			pstmt.setString(2, vo.getNotice_contents());
			pstmt.setString(3, vo.getNotice_who());
			pstmt.setString(4, vo.getEmp_no());


			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	public BoardManageVo noticeSelectOne(BoardManageVo vo) {
		String sql = noticeSelectOne;
		BoardManageVo resultVo = new BoardManageVo();
		try {
			conn = ConnectionManager.getConnnect();
			System.out.println(vo.getNotice_no());
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_no());

			System.out.println("ndfqnasql"+sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				resultVo.setNotice_contents(rs.getString("notice_contents"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setNotice_image(rs.getString("notice_image"));
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_who(rs.getString("notice_who"));
				resultVo.setNotice_whov(rs.getString("notice_whov"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_image(rs.getString("notice_image"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		System.out.println(resultVo.getNotice_title());
		return resultVo;
	}

	public ArrayList<BoardManageVo> findQna(BoardManageVo vo) {
		ArrayList<BoardManageVo> list = new ArrayList<>();
		String sql = qnaFind;
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getWho().equals("all")) {
				vo.setWho("");
			}
			if (vo.getCategory().equals("all")) {
				vo.setCategory("");
			}
			if (vo.getAnswerStatus().equals("0")) {
				sql += uncomplete_ans;
			} else if (vo.getAnswerStatus().equals("1")) {
				sql += complete_ans;
			}
			if (vo.getSearchType().equals("title")) {
				sql += qna_title;

			} else if (vo.getSearchType().equals("contents")) {
				sql += qna_contents;

			} else if (vo.getSearchType().equals("id")) {
				sql += emp_no;

			} else {
				sql += qna_title;
			}
			if (vo.getExcludeAnswer() != null) {
				sql += exclude_ans;
			}
			System.out.println("nqnasql" + sql);
			sql += end;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getWho());
			pstmt.setString(4, vo.getCategory());

			pstmt.setString(5, vo.getSearchInput());
			rs = pstmt.executeQuery();

			while (rs.next()) {

				BoardManageVo resultVo = new BoardManageVo();
//				System.out.println(rs.getString("qna_no"));
				resultVo.setQna_no(rs.getString("qna_no"));
				resultVo.setQna_title(rs.getString("qna_title"));
				resultVo.setQna_writedate(rs.getString("qna_writedate"));
				resultVo.setQna_shop_customer_no(rs.getString("qna_shop_customer_no"));
				resultVo.setQna_hits(rs.getString("qna_hits"));
				resultVo.setQna_ref(rs.getString("qna_ref"));
				resultVo.setQna_repos(rs.getString("qna_repos"));
				resultVo.setQna_level(rs.getString("qna_level"));
				resultVo.setQna_who(rs.getString("qna_who"));
				resultVo.setQna_whov(rs.getString("qna_whov"));
				resultVo.setQna_category(rs.getString("qna_category"));
				resultVo.setQna_categoryv(rs.getString("qna_categoryv"));
				resultVo.setExcludeAnswer(rs.getString("answerComplete"));

				if (Integer.parseInt(resultVo.getExcludeAnswer()) > 1) {
					resultVo.setAnswerStatus("답변완료");
				} else {
					resultVo.setAnswerStatus("미답변");
				}
				if (!(resultVo.getQna_no().equals(resultVo.getQna_ref()))) {
					resultVo.setAnswerStatus("-");
				}
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

	public ArrayList<BoardManageVo> findNotice(BoardManageVo vo) {
		ArrayList<BoardManageVo> list = new ArrayList<>();
		String sql = noticeFind;
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getWho().equals("all")) {
				vo.setWho("");
			}

			if (vo.getSearchType().equals("title")) {
				sql += notice_title;

			} else if (vo.getSearchType().equals("contents")) {
				sql += notice_contents;

			} else if (vo.getSearchType().equals("id")) {
				sql += emp_no;

			} else {
				sql += notice_title;
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getWho());

			pstmt.setString(4, vo.getSearchInput());
			rs = pstmt.executeQuery();

			while (rs.next()) {

				BoardManageVo resultVo = new BoardManageVo();

				resultVo.setNotice_contents(rs.getString("notice_contents"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setNotice_image(rs.getString("notice_image"));
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_who(rs.getString("notice_who"));
				resultVo.setNotice_whov(rs.getString("notice_whov"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_image(rs.getString("notice_image"));

//				

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

}
