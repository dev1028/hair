package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.BoardManageVo;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class BoardManageDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static BoardManageDAO instance = null;

	final static String noticeFind = "select * " + "FROM notice\r\n" + "WHERE  notice_writedate BETWEEN ? AND ?\r\n";

	final static String notice_who = "AND NOTICE_who like'%'||?||'%' ";
	final static String notice_title = "and notice_title like '%'||?||'%' ";
	final static String notice_contents = "and notice_contents like '%'||?||'%' ";
	final static String qna_title = "and qna_title like '%'||?||'%' ";
	final static String qna_contents = "and qna_contents like '%'||?||'%' ";
	final static String emp_no = "and emp_no like '%'||?||'%' ";
	final static String qnaFind = "select QNA_NO	,QNA_SHOP_CUSTOMER_NO	,QNA_TITLE	,QNA_CONTENTS	,QNA_WRITEDATE	,QNA_OPENSTATUS	,QNA_HITS,QNA_CATEGORY ,EMP_NO ,QNA_WHO ,QNA_REF,QNA_REPOS,QNA_LEVEL,QNA_WRITER FROM qna\n"
			+ "WHERE qna_writedate BETWEEN?AND?\n" + "AND qna_who like'%'||?||'%'\n"
			+ "and qna_category like'%'||?||'%'";
	final static String ans_com = " and qna_no <> qna_ref ";
	final static String ans_unc = " and qna_no = qna_ref ";

	public static BoardManageDAO getInstance() {
		if (instance == null)
			instance = new BoardManageDAO();
		return instance;
	}

	public ArrayList<BoardManageVo> findNotice(BoardManageVo vo) {
		ArrayList<BoardManageVo> list = new ArrayList<>();
		String sql = "";
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getWho().equals("all")) {
				vo.setWho("");
			}
			if (vo.getSearchType().equals("title")) {
				sql = noticeFind + notice_who + notice_title;

			} else if (vo.getSearchType().equals("contents")) {
				sql = noticeFind + notice_who + notice_contents;

			} else if (vo.getSearchType().equals("id")) {
				sql = noticeFind + notice_who + emp_no;

			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getWho());
			pstmt.setString(4, vo.getSearchInput());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				BoardManageVo resultVo = new BoardManageVo();
				resultVo.setB_no(rs.getString("notice_no"));
				resultVo.setB_title(rs.getString("notice_title"));
				resultVo.setB_wd(rs.getString("notice_writedate"));
				resultVo.setB_hits(rs.getString("notice_hits"));
				resultVo.setB_writer(rs.getString("emp_no"));
				resultVo.setB_who(rs.getString("notice_who"));
				resultVo.setB_category(rs.getString("notice_categoryname"));
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<HairshopNoticeVo> findNoticeAll(BoardManageVo vo) {
		ArrayList<HairshopNoticeVo> list = new ArrayList<>();
		HairshopNoticeVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(noticeFind);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getSearchType());
			pstmt.setString(4, vo.getSearchInput());
			pstmt.setString(5, vo.getCategory());
			rs = pstmt.executeQuery();
			System.out.println(noticeFind);
			while (rs.next()) {

				resultVo = new HairshopNoticeVo();
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_categoryname(rs.getString("notice_categoryname"));
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
//		
//		for(SalesVo vo : list) {
//			System.out.println(vo.getHName());
//		}
		return list;
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
				sql += ans_unc;
			} else if (vo.getAnswerStatus().equals("1")) {
				sql += ans_com;
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
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getWho());
			pstmt.setString(4, vo.getCategory());

			pstmt.setString(5, vo.getSearchInput());
			rs = pstmt.executeQuery();
			System.out.println("nqnasql" + sql);

			while (rs.next()) {

				BoardManageVo resultVo = new BoardManageVo();
//				System.out.println(rs.getString("qna_no"));
				resultVo.setB_no(rs.getString("qna_no"));
				resultVo.setB_title(rs.getString("qna_title"));
				resultVo.setB_wd(rs.getString("qna_writedate"));
				resultVo.setB_writer(rs.getString("qna_shop_customer_no"));
				resultVo.setB_hits(rs.getString("qna_hits"));
				resultVo.setB_a(rs.getString("qna_ref"));
				resultVo.setB_who(rs.getString("qna_who"));
				resultVo.setB_category(rs.getString("qna_category"));

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
