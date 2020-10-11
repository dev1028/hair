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

	public int update(HairshopVo hairshopVo) {
		ResultSet rs = null;
		int r = 0;
		String sql = "update hairshop set hs_dayoff = ?" + " WHERE hs_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_dayoff());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return r;
	}
}
