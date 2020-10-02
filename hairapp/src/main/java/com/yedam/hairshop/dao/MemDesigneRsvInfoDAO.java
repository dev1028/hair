package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	// 2020.09.26 김승연
	// 상세정보에서 머리이름 알아오기
	public List<Map<String, String>> rsvInfoHairName(String mdrNo) {
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select mdri.mdr_no, mdri.mdri_detail_info, mdri.hhi_no, hhi.hhi_name"
					+ " from mem_designer_rsv_info mdri join hairshop_hair_info hhi" + " on(mdri.hhi_no = hhi.hhi_no)"
					+ " where mdri.mdr_no = ?" + " order by mdri.mdri_detail_info";
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

	// 2020.09.28 김승연
	// 예약번호로 머리상세정보 가져오기
	public List<Map<String, String>> selectHairInfo(String mdrNo) {
		ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select mdri.mdr_no, mdri.mdri_detail_info, mdri.hhi_no, mdri.mdri_memo, h.hhi_name, h.hhi_price, h.hhi_time"
					+ " from mem_designer_rsv_info mdri join hairshop_hair_info h" + " on(mdri.hhi_no = h.hhi_no)"
					+ " where mdri.mdr_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdrNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("mdr_no", rs.getString("mdr_no"));
				map.put("mdri_detail_info", rs.getString("mdri_detail_info"));
				map.put("hhi_no", rs.getString("hhi_no"));
				map.put("mdri_memo", rs.getString("mdri_memo"));
				map.put("hhi_name", rs.getString("hhi_name"));
				map.put("hhi_price", rs.getString("hhi_price"));
				map.put("hhi_time", rs.getString("hhi_time"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	}
	
	// 2020.10.01
	//예약상세정보 메모 업로드하기
	public int updateMdriMemo(MemDesignerRsvInfoVo mDRIVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE MEM_DESIGNER_RSV_INFO SET MDRI_MEMO = ? WHERE MDR_NO = ? AND MDRI_DETAIL_INFO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDRIVo.getMdri_memo());
			pstmt.setString(2, mDRIVo.getMdr_no());
			pstmt.setString(3, mDRIVo.getMdri_detail_info());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

}
