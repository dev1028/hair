package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class NoticeDAO {

	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static NoticeDAO instance;

	public static NoticeDAO getInstance() {
		if (instance == null)
			instance = new NoticeDAO();
		return instance;
	}

	// 공지사항 view
	public HairshopNoticeVo noticeView(HairshopNoticeVo noticeVo) {
		HairshopNoticeVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME"
					+ " FROM NOTICE "
					+ " WHERE NOTICE_WHO = 'j2'" + " AND NOTICE_NO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new HairshopNoticeVo();
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_contents(rs.getString("notice_contents"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setNotice_image(rs.getString("notice_image"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_categoryname(rs.getString("notice_categoryname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;

	}
	

	// 조회수
	public int upHit(HairshopNoticeVo noticeVo) {
		int result = 0;
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement("UPDATE NOTICE"
					+ " SET NOTICE_HITS = NOTICE_HITS + 1"
					+ " WHERE NOTICE_NO = ?");
			pstmt.setString(1, noticeVo.getNotice_no());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return result;
	}

	
	// 공지사항 작성
	// notice_no_seq
	public int insert(HairshopNoticeVo noticeVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO NOTICE(NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME, NOTICE_WHO)"
					+ " VALUES(NOTICE_NO_SEQ.NEXTVAL, ?, ?, sysdate, 0, ?, 50, ?,'j2')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_title());
			pstmt.setString(2, noticeVo.getNotice_contents());
			pstmt.setString(3, noticeVo.getNotice_image());
			pstmt.setString(4, noticeVo.getNotice_categoryname());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	// 전체 조회(페이징)
	public ArrayList<HairshopNoticeVo> selectPaging(HairshopNoticeVo noticeVo) { // 조회가 여러건이면 DeptVO를 list에 담음
		HairshopNoticeVo resultVO = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<HairshopNoticeVo> list = new ArrayList<HairshopNoticeVo>(); // 결과값을 저장할 list 변수 객체 선언
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "select a.* from (select rownum rn,b.* from ("
					+ " SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME" + " FROM NOTICE"
					+ " where notice_who = 'j2'" + " ORDER BY NOTICE_WRITEDATE desc"
					+ " ) b) a where rn between ? and ?";
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			int pos = 1; // 물음표값 동적으로 하려고 변수선언

			pstmt.setInt(pos++, noticeVo.getFirst()); // 물음표부분이 pos++로 인해 동적으로 늘어남
			pstmt.setInt(pos++, noticeVo.getLast());
			rs = pstmt.executeQuery(); // select 시에는 executeQuery() 쓰기

			while (rs.next()) { // 여러건 조회라서 while를 사용. next()로 한건 한건마다 true 인지 false인지 확인하고 이동함
				resultVO = new HairshopNoticeVo(); // 레코드 한건을 resultVO에 담음
				resultVO.setNotice_no(rs.getString("notice_no"));
				resultVO.setNotice_title(rs.getString("notice_title"));
				resultVO.setNotice_contents(rs.getString("notice_contents"));
				resultVO.setNotice_writedate(rs.getString("notice_writedate"));
				resultVO.setNotice_hits(rs.getString("notice_hits"));
				resultVO.setNotice_image(rs.getString("notice_image"));
				resultVO.setEmp_no(rs.getString("emp_no"));
				resultVO.setNotice_categoryname(rs.getString("notice_categoryname"));
				list.add(resultVO); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// 전체 건수
	public int count(HairshopNoticeVo noticeVo) {
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "SELECT COUNT(*) FROM NOTICE" + " WHERE NOTICE_WHO = 'j2' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}

}
