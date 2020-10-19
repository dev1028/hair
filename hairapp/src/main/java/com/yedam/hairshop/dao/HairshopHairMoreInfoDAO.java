package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopHairMoreInfoVo;

public class HairshopHairMoreInfoDAO {
	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	//ResultSet rs = null;

	// 싱글톤
	static HairshopHairMoreInfoDAO instance;

	public static HairshopHairMoreInfoDAO getInstance() {
		if (instance == null)
			instance = new HairshopHairMoreInfoDAO();
		return instance;
	}
	
	public List<HairshopHairMoreInfoVo> selectByHhiNo(HairshopHairMoreInfoVo hhmiVo){
		ResultSet rs = null;
		List<HairshopHairMoreInfoVo> list = new ArrayList<HairshopHairMoreInfoVo>(); // 결과값을 저장할 list 변수 객체 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HHMI_NO,HHI_NO,HHMI_FILE,DESIGNER_NO FROM HAIRSHOP_HAIR_MORE_INFO where HHI_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hhmiVo.getHhi_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairMoreInfoVo resultVo = new HairshopHairMoreInfoVo();
				resultVo.setHhmi_no(rs.getString("HHMI_NO"));
				resultVo.setHhi_no(rs.getString("HHI_NO"));
				resultVo.setHhmi_file(rs.getString("HHMI_FILE"));
				resultVo.setDesigner_no(rs.getString("DESIGNER_NO"));
				list.add(resultVo); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	public int inserthairPic(HairshopHairMoreInfoVo hhmiVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " insert into hairshop_hair_more_info (hhmi_no,hhi_no,hhmi_file,designer_no)" + 
					" VALUES ((select nvl(max(hhmi_no),0)" + 
					" from hairshop_hair_more_info" + 
					" where hhi_no = ?)+1, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hhmiVo.getHhi_no()));
			pstmt.setInt(2, Integer.parseInt(hhmiVo.getHhi_no()));
			pstmt.setString(3, hhmiVo.getHhmi_file());
			pstmt.setString(4, hhmiVo.getDesigner_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

}
