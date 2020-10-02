package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairBookmarkVo;

public class HairBookmarkDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static HairBookmarkDAO instance;

	public static HairBookmarkDAO getInstance() {
		if (instance == null)
			instance = new HairBookmarkDAO();
		return instance;
	}

	// 북마크 되어있는지 확인
	public boolean HasBookmark(HairBookmarkVo vo) {
		String sql = " SELECT * FROM favor_hair " 
				   + " WHERE hhi_no = ? AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHhi_no());
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
	
	public int DelBookmark(HairBookmarkVo vo) {
		int r = 0;
		String sql = "DELETE FROM favor_hair WHERE hhi_no = ? AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHhi_no());
			pstmt.setString(2, vo.getMem_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public int Bookmark(HairBookmarkVo vo) {
		int r = 0;
		String sql = "INSERT INTO favor_hair(hhi_no, mem_no) VALUES(?, ?)";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHhi_no());
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
