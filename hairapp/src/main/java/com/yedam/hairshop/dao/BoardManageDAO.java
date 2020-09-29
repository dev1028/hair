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

	final static String noticeFind = "select * " + "FROM notice\r\n" + "WHERE  notice_writedate BETWEEN ? AND ?\r\n";
	final static String noticeSearch = "AND ? = ?\r\n";
	final static String noticeCategory = "AND NOTICE_CATEGORYNAME IN(?)";

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

			pstmt = conn.prepareStatement(noticeFind+noticeCategory);
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

			pstmt = conn.prepareStatement(noticeFind+noticeSearch);
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
	public ArrayList<HairshopNoticeVo> findNotice(BoardManageVo vo) {
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

	public ArrayList<HairshopNoticeVo> findQna(BoardManageVo vo) {
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

	public ArrayList<SalesVo> dailySalesAllAddDs(String start, String end, String ds_no) {
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(totaldaily + addDs);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			pstmt.setString(3, ds_no);

			rs = pstmt.executeQuery();
			System.out.println("sql");
			while (rs.next()) {

				resultVo = new SalesVo();
				resultVo.setMdrNo(rs.getString("mdr_no"));
				resultVo.setMdrDate(rs.getString("mdr_date"));
				resultVo.setDsName(rs.getString("designer_name"));
				resultVo.setMemName(rs.getString("mem_name"));
				resultVo.setHName(rs.getString("hhi_name"));
				resultVo.setCard(rs.getString("card"));
				resultVo.setCash(rs.getString("cash"));
				resultVo.setKakao(rs.getString("kakao"));
				resultVo.setAccount(rs.getString("account"));
				resultVo.setTotalAmountRsv(rs.getString("ammount"));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		for (SalesVo vo : list) {
			System.out.println(vo.getHName());
		}
		return list;
	}

	public ArrayList<DesignerVo> getDsName() {
		ArrayList<DesignerVo> list = new ArrayList<>();
		DesignerVo resultVo = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT designer_no, designer_name	FROM designer  ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new DesignerVo();
				resultVo.setDesigner_no(rs.getString(1));
				resultVo.setDesigner_name(rs.getString(2));

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
