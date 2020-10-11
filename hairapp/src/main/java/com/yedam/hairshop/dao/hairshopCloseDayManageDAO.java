package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopVo;

public class hairshopCloseDayManageDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static hairshopCloseDayManageDAO instance;

	public static hairshopCloseDayManageDAO getInstance() {
		if (instance == null)
			instance = new hairshopCloseDayManageDAO();
		return instance;
	}

	/*
	 * public HairshopVo selectOne(HairshopVo hairshopVo) { ResultSet rs = null;
	 * HairshopVo resultVo = null; try { conn = ConnectionManager.getConnnect();
	 * String sql = "SELECT hs_no, hs_name, hs_owner, hs_tel, hs_" } }
	 */
	//휴무일 업데이트
	public int dayOffUpdate(HairshopVo hairshopVo) {
		ResultSet rs = null;
		int r = 0;
		String sql = "UPDATE hairshop SET hs_dayoff = ? WHERE hs_no = ? ";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_dayoff());
			pstmt.setString(2, hairshopVo.getHs_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return r;
	}
}
