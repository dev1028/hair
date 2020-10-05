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
	
	
	//결제가 아닌 예약. 예약후, 입금대기 상태에서 결제해야함.
	public int onlinePay(PaymentVo vo) {
		//여기서  프로시저를 호출하는 식으로 결제를 한다.
		int result = -1;
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}
}
