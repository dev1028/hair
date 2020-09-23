package com.yedam.hairshop.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignersLeaveInfoVo;
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
		conn = ConnectionManager.getConnnect();
		try {
			CallableStatement pstmt = conn.prepareCall("{call memberPay(?,?,?,?)}");
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getDesigner_no());
			pstmt.setString(3, vo.getHs_no());
			pstmt.setString(4, vo.getMdr_online_price());
			//pstmt.registerOutParameter(4, Types.INTEGER);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}
}
