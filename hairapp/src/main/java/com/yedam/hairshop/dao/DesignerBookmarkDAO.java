package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignerBookmarkVo;

public class DesignerBookmarkDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static DesignerBookmarkDAO instance;

	public static DesignerBookmarkDAO getInstance() {
		if (instance == null)
			instance = new DesignerBookmarkDAO();
		return instance;
	}
	
	//북마크 되어있는지 확인
	public boolean HasBookmark(DesignerBookmarkVo vo) {
		String sql = " SELECT * FROM favor_designer "
				+ " WHERE designer_no = ? AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDesigner_no());
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
	
	public int DelBookmark(DesignerBookmarkVo vo) {
		int r = 0;
		String sql = "DELETE FROM favor_designer WHERE designer_no = ? AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDesigner_no());
			pstmt.setString(2, vo.getMem_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public int Bookmark(DesignerBookmarkVo vo) {
		int r = 0;
		String sql = "INSERT INTO favor_designer(designer_no, mem_no) VALUES(?, ?)";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDesigner_no());
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
