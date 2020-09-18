package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yedam.hairshop.model.DesignerVo;

public class DesignerDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null; // 초기화
	
	static DesignerDAO instance;
	public static DesignerDAO getInstance() {
		if(instance == null)
			instance=new DesignerDAO();
			return instance;
	}
	//디자이너 정보 추가
	
	public int update(DesignerVo designerVo) {
		int r = 0;
		String sql = "update designer set designer_pw = ?, designer_phone = ?, designer_dayoff = ?  "
					+ " work_start_time = ?, work_end_time = ?, hire_date = ? , designer_profile = ? where designer_no = ?" ;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, designerVo.getDesigner_pw());
			pstmt.setString(2, designerVo.getDesigner_phone());
			pstmt.setString(3, designerVo.getDesigner_dayoff());
			pstmt.setString(4, designerVo.getWork_start_time());
			pstmt.setString(5, designerVo.getWork_end_time());
			pstmt.setString(6, designerVo.getHire_date());
			pstmt.setString(7, designerVo.getDesigner_profile());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			return r;
	}
	
}
