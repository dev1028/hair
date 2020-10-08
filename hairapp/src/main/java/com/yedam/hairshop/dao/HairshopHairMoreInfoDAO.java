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
			String sql = "SELECT HHMI_NO,HHI_NO,HHMI_FILE,DESIGNER_NO FROM HAIRSHOP_HAIR_MORE_INFO";
			pstmt = conn.prepareStatement(sql);
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
		return null;
	}

}
