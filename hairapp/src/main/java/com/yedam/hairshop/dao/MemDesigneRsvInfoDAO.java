package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.MemDesignerRsvInfoVo;

public class MemDesigneRsvInfoDAO {
	// 전역변수
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static MemDesigneRsvInfoDAO instance;

	public static MemDesigneRsvInfoDAO getInstance() {
		if (instance == null)
			instance = new MemDesigneRsvInfoDAO();
		return instance;
	}

	// 2020.09.26 김승연
	// 단건조회
	public MemDesignerRsvInfoVo selectOne(MemDesignerRsvInfoVo mdriVo) {

		return null;
	}

	public List<Map<String, String>> rsvInfoHairName(String mdrNo) {
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select mdri.mdr_no, mdri.mdri_detail_info, mdri.hhi_no, hhi.hhi_name"
					+ " from mem_designer_rsv_info mdri join hairshop_hair_info hhi" 
					+ " on(mdri.hhi_no = hhi.hhi_no)"
					+ " where mdri.mdr_no = ?" 
					+ " order by mdri.mdri_detail_info";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdrNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("mdr_no", rs.getString("mdr_no"));
				map.put("mdri_detail_info", rs.getString("mdri_detail_info"));
				map.put("hhi_no", rs.getString("hhi_no"));
				map.put("hhi_name", rs.getString("hhi_name"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
