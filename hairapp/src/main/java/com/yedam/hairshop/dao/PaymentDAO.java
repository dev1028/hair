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
	
	static PaymentDAO instance = null;
	
	public static PaymentDAO getInstance(){
		if(instance == null)
			instance = new PaymentDAO();
		return instance;
	}
	
	
	//입금 대기 상태
	public int onlinePay(PaymentVo vo) {
		ResultSet rs = null;
		//여기서  프로시저를 호출하는 식으로 결제를 한다.
		int result = -1;
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement pstmt = conn.prepareCall("{call memberPay(?,?,?,?,?,?,?,?,?,?)}");
			System.out.println(vo.toString());
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getHs_no());
			pstmt.setString(3, vo.getDesigner_no());
			pstmt.setString(4, vo.getHhi_no1());
			pstmt.setString(5, vo.getHhi_no2());
			pstmt.setString(6, vo.getHhi_no3());
			pstmt.setString(7, vo.getMdr_date());
			pstmt.setString(8, vo.getMc_no());
			pstmt.setString(9, vo.getUse_saved_money());
			pstmt.registerOutParameter(10, Types.INTEGER);
			pstmt.executeUpdate();
			result = pstmt.getInt(10);
			System.out.println("RESULT: " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	//입금 완료상태
	public int onlinePaySuc(PaymentVo vo) {
		ResultSet rs = null;
		int r = -1;
		try {
			String sql = " UPDATE members_designer_rsv SET mdr_status='i2' "
					   + " WHERE mdr_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMdr_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}
	
	//입금실패.
	public int onlinePayFailed(PaymentVo vo) {
		ResultSet rs = null;
		int r = -1;
		try {
			String sql = " DELETE members_designer_rsv "
					   + " WHERE mdr_status='i0' "
					   + " AND mdr_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMdr_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}
}
