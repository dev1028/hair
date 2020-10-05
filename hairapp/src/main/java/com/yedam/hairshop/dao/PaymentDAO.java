package com.yedam.hairshop.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.PaymentVo;

public class PaymentDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static PaymentDAO instance = null;
	
	public static PaymentDAO getInstance(){
		if(instance == null)
			instance = new PaymentDAO();
		return instance;
	}
	
	
	public void onlinePay(PaymentVo vo) {
		//여기서  프로시저를 호출하는 식으로 결제를 한다.
		
		int result;
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement pstmt = conn.prepareCall("{call memberPay(?,?,?,?,?,?,?,?)}");
			System.out.println(vo.toString());
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getHs_no());
			pstmt.setString(3, vo.getDesigner_no());
			pstmt.setString(4, vo.getHhi_no1());
			pstmt.setString(5, vo.getHhi_no2());
			pstmt.setString(6, vo.getHhi_no3());
			pstmt.setString(7, vo.getMdr_date());
			pstmt.registerOutParameter(8, Types.INTEGER);
			pstmt.executeUpdate();
			result = pstmt.getInt(8);
			System.out.println("RESULT: " + result);
			
//			String sql = "INSERT INTO members_designer_rsv(MDR_NO, MDR_DATE, MEM_NO, HS_NO, " + 
//					"                                DESIGNER_NO, MDR_STATUS) " + 
//					"VALUES( member_designer_rsv_seq.nextval, TO_DATE(?, 'YYYY-MM-DD HH24'), ?, ?, ?, 'i1')";
//			conn = ConnectionManager.getConnnect();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getMdr_date());
//			pstmt.setString(2, vo.getMem_no());
//			pstmt.setString(3, vo.getHs_no());
//			pstmt.setString(4, vo.getDesigner_no());
//			//pstmt.registerOutParameter(4, Types.INTEGER);
//			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		
//		try {
//			String sql = "INSERT INTO mem_designer_rsv_info(MDRI_DETAIL_INFO, MDR_NO, HHI_NO, MDRI_MEMO " +
//						 "VALUES(?, ?, ?, ?) ";
//			conn = ConnectionManager.getConnnect();
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(2, vo.getMdr_no());
//			
////			pstmt.setString(1, vo.getMdr_date());
////			pstmt.setString(2, vo.getMem_no());
////			pstmt.setString(3, vo.getHs_no());
////			pstmt.setString(4, vo.getDesigner_no());
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			ConnectionManager.close(rs, pstmt, conn);
//		}
	}
}
