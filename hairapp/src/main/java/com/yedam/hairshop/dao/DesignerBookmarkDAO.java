package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignerBookmarkVo;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerBookmarkDAO {
	static Connection conn;
	PreparedStatement pstmt;
	
	// 싱글톤
	static DesignerBookmarkDAO instance;

	public static DesignerBookmarkDAO getInstance() {
		if (instance == null)
			instance = new DesignerBookmarkDAO();
		return instance;
	}
	
	//북마크 되어있는지 확인
	public boolean HasBookmark(DesignerBookmarkVo vo) {
		ResultSet rs = null;
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
	
	public List<DesignerVo> getBookmarkList(DesignerBookmarkVo vo){
		ResultSet rs = null;
		List<DesignerVo> list = new ArrayList<DesignerVo>();
		String sql = " SELECT d.designer_no, d.designer_name, d.designer_dayoff, " + 
		             "        d.work_start_time, d.work_end_time, d.designer_profile, d.hs_no " + 
					 " FROM designer d, favor_designer f " + 
					 " WHERE d.designer_no = f.designer_no " + 
					 " AND mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DesignerVo tmpVo = new DesignerVo();
				tmpVo.setDesigner_no(rs.getString("designer_no"));
				tmpVo.setDesigner_name(rs.getString("designer_name"));
				tmpVo.setDesigner_dayoff(rs.getString("designer_dayoff"));
				tmpVo.setWork_start_time(rs.getString("work_start_time"));
				tmpVo.setWork_end_time(rs.getString("work_end_time"));
				tmpVo.setDesigner_profile(rs.getString("designer_profile"));
				tmpVo.setHs_no(rs.getString("hs_no"));
				list.add(tmpVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
	}
}
