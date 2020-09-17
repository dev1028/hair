package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
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
	
	//미용실별 디자이너 목록 
	//2020.09.17 승연
	public ArrayList<DesignerVo> selectByHairShop(DesignerVo dVo) {
		ArrayList<DesignerVo> list = new ArrayList<DesignerVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT DESIGNER_NO,DESIGNER_NAME,DESIGNER_PHONE,DESIGNER_EMAIL,DESIGNER_PW,"
					+ " DESIGNER_DAYOFF,WORK_START_TIME,WORK_END_TIME,DESIGNER_ACCESS_STATUS,POSITION,"
					+ " SALARY,INCENTIVE,HIRE_DATE,HS_NO"
					+ " FROM DESIGNER"
					+ " WHERE HS_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getHs_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DesignerVo designer = new DesignerVo();
				designer.setDesigner_no(rs.getString("DESIGNER_NO"));
				designer.setDesigner_name(rs.getString("DESIGNER_NAME"));
				designer.setDesigner_phone(rs.getString("DESIGNER_PHONE"));
				designer.setDesigner_email(rs.getString("DESIGNER_EMAIL"));
				designer.setDesigner_pw(rs.getString("DESIGNER_PW"));
				designer.setDesigner_dayoff(rs.getString("DESIGNER_DAYOFF"));
				designer.setWork_start_time(rs.getString("WORK_START_TIME"));
				designer.setWork_end_time(rs.getString("WORK_END_TIME"));
				designer.setDesigner_access_status(rs.getString("DESIGNER_ACCESS_STATUS"));
				designer.setPosition(rs.getString("POSITION"));
				designer.setSalary(rs.getString("SALARY"));
				designer.setIncentive(rs.getString("INCENTIVE"));
				designer.setHire_date(rs.getString("HIRE_DATE"));
				designer.setHs_no(rs.getString("HS_NO"));
				list.add(designer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
		
	}
	
	
	
}
