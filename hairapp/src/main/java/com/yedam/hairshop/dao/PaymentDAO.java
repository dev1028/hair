package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		
		
		try {
//			CallableStatement pstmt = conn.prepareCall("{call memberPay(?,?,?,?)}");
			String sql = "INSERT INTO members_designer_rsv(MDR_NO, MDR_DATE, MEM_NO, HS_NO, " + 
					"                                DESIGNER_NO, MDR_STATUS) " + 
					"VALUES( member_designer_rsv_seq.nextval, TO_DATE(?, 'YYYY-MM-DD HH24'), ?, ?, ?, 'i1')";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMdr_date());
			pstmt.setString(2, vo.getMem_no());
			pstmt.setString(3, vo.getHs_no());
			pstmt.setString(4, vo.getDesigner_no());
			//pstmt.registerOutParameter(4, Types.INTEGER);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}
}
