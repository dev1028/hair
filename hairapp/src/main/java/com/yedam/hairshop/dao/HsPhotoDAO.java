package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HsPhotoVo;

public class HsPhotoDAO {
	// 전역변수
	static Connection conn;
	PreparedStatement pstmt;
	

	// 싱글톤
	static HsPhotoDAO instance;

	public static HsPhotoDAO getInstance() {
		if (instance == null)
			instance = new HsPhotoDAO();
		return instance;
	}
	
	// 2020.10.11 김승연
	// 사진넣기
	public int insert(HsPhotoVo hPVo) {
		int r = 0;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO HS_PHOTO (HSP_NO,HS_NO,HSP_FILE)" + 
					" VALUES ((SELECT NVL(MAX(HSP_NO),0)+1 FROM HS_PHOTO WHERE HS_NO = ?),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hPVo.getHs_no());
			pstmt.setString(2, hPVo.getHs_no());
			pstmt.setString(3, hPVo.getHsp_file());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return r;
	}
}
