package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	// 공지사항 list
	public List<HairshopNoticeVo> selectList() {
		List<HairshopNoticeVo> list = new ArrayList<HairshopNoticeVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME"
					+ " FROM NOTICE ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HairshopNoticeVo resultVo = new HairshopNoticeVo();
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_contents(rs.getString("notice_contents"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setNotice_image(rs.getString("notice_image"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_categoryname(rs.getString("notice_categoryname"));
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
