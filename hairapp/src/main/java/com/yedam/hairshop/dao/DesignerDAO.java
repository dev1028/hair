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
	
	public int update(DesignerVo designerVO) {
		int r = 0;
		String sql = "update designer set designer_pw = ?, designer_phone = ?, designer_dayoff = ?  "
					+ " work_start_time = ?, work_end_time = ?, hire_date = ? where designer_no = ?" ;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, designerVO.getDesigner_pw());
			pstmt.setString(2, designerVO.getDesigner_phone());
			pstmt.setString(3, designerVO.getDesigner_dayoff());
			pstmt.setString(4, designerVO.getWork_start_time());
			pstmt.setString(5, designerVO.getWork_end_time());
			pstmt.setString(6, designerVO.getHire_date());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			return r;
	}
	
}
