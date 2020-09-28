package com.yedam.hairshop.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopBookmarkVo;

public class HairshopBookmarkDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static HairshopBookmarkDAO instance;

	public static HairshopBookmarkDAO getInstance() {
		if (instance == null)
			instance = new HairshopBookmarkDAO();
		return instance;
	}
	
	//북마크 되어있는지 확인
	public boolean HasBookmark(HairshopBookmarkVo vo) {
		String sql = " SELECT * FROM favor_hs "
				+ " WHERE hs_no = ? AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			pstmt.setString(2, vo.getMem_no());
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return false;
	}
	
	public int DelBookmark(HairshopBookmarkVo vo) {
		int r = 0;
		String sql = "DELETE FROM favor_hs WHERE hs_no = ? AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			pstmt.setString(2, vo.getMem_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public int Bookmark(HairshopBookmarkVo vo) {
		int r = 0;
		String sql = "INSERT INTO favor_hs(hs_no, mem_no) VALUES(?, ?)";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			pstmt.setString(2, vo.getMem_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
}
