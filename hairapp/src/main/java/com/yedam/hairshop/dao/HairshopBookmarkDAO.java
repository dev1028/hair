package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;

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
	
	public List<HairshopVo> getBookmarkList(HairshopBookmarkVo vo){
		List<HairshopVo> list = new ArrayList<HairshopVo>();
		String sql =
				"SELECT h.hs_no, h.hs_name, h.hs_owner,  " + 
				"      h.hs_tel, h.hs_email, h.hs_profile,  " + 
				"      h.hs_notice, h.hs_fulladdr,  " + 
				"      h.hs_starttime, h.hs_endtime " + 
				"FROM favor_hs f, hairshop h " + 
				"WHERE f.hs_no = h.hs_no  " + 
				"AND f.mem_no = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HairshopVo tmpVo = new HairshopVo();
				tmpVo.setHs_no(rs.getString("hs_no"));
				tmpVo.setHs_name(rs.getString("hs_name"));
				tmpVo.setHs_owner(rs.getString("hs_owner"));
				tmpVo.setHs_tel(rs.getString("hs_tel"));
				tmpVo.setHs_email(rs.getString("hs_email"));
				tmpVo.setHs_profile(rs.getString("hs_profile"));
				tmpVo.setHs_notice(rs.getString("hs_notice"));
				tmpVo.setHs_fulladdr(rs.getString("hs_fulladdr"));
				tmpVo.setHs_starttime(rs.getString("hs_starttime"));
				tmpVo.setHs_endtime(rs.getString("hs_endtime"));
				tmpVo.setHs_book("1");
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
