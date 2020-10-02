package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.BoardManageVo;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopNoticeVo;
import com.yedam.hairshop.model.SalesVo;

public class BoardManageDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static BoardManageDAO instance = null;

	final static String noticeFind = "select * " + "FROM notice\r\n" + "WHERE  notice_writedate BETWEEN ? AND ?\r\n"
	+"AND ? = ?\r\n"
	+"AND NOTICE_who IN(?)";
	
	final static String qnaFind ="select * FROM qna\n" + 
			"WHERE  qna_writedate BETWEEN ? AND ?\n" + 
			"AND ? = ?\n" + 
			"AND qna_who like ?\n" + 
			"and qna_category like ?";

	public static BoardManageDAO getInstance() {
		if (instance == null)
			instance = new BoardManageDAO();
		return instance;
	}

	public ArrayList<HairshopNoticeVo> findNoticeCategory(BoardManageVo vo) {
		ArrayList<HairshopNoticeVo> list = new ArrayList<>();
		HairshopNoticeVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(noticeFind);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getCategory());
			rs = pstmt.executeQuery();
			System.out.println("sql");
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

	public ArrayList<HairshopNoticeVo> findNoticeSearch(BoardManageVo vo) {
		ArrayList<HairshopNoticeVo> list = new ArrayList<>();
		HairshopNoticeVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(noticeFind + noticeSearch);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getSearchType());
			pstmt.setString(4, vo.getSearchInput());

			rs = pstmt.executeQuery();
			System.out.println("sql");
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

	public ArrayList<HairshopNoticeVo> findNoticeDate(BoardManageVo vo) {
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
			System.out.println("sql");
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

	public ArrayList<HairshopNoticeVo> findQna(BoardManageVo vo) {
		ArrayList<HairshopNoticeVo> list = new ArrayList<>();
		HairshopNoticeVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(qnaFind);
			pstmt.setString(1, vo.getStartDate());
			pstmt.setString(2, vo.getEndDate());
			pstmt.setString(3, vo.getSearchType());
			pstmt.setString(4, vo.getSearchInput());
			pstmt.setString(5, "%"+vo.getWho()+"%");
			pstmt.setString(6, "%"+vo.getCategory()+"%");
			rs = pstmt.executeQuery();
			System.out.println("sql");
			while (rs.next()) {

				resultVo = new HairshopNoticeVo();
				resultVo.setQna_no(rs.getString("qna_no"));
				resultVo.setQna_title(rs.getString("qna_title"));
				resultVo.setQna_writedate(rs.getString("qna_writedate"));
				resultVo.setQna_who(rs.getString("qna_who"));
				resultVo.setQna_hits(rs.getString("qna_hits"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setQna_category(rs.getString("qna_category"));

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
}
