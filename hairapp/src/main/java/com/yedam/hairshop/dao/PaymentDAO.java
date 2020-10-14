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
	
	
	public int onlinePayi0(PaymentVo vo) {
		ResultSet rs = null;
		int result = -1;
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement pstmt = conn.prepareCall("{call memberPayi0(?,?,?,?,?,?,?,?,?)}");
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getHs_no());
			pstmt.setString(3, vo.getDesigner_no());
			pstmt.setString(4, vo.getHhi_no1());
			pstmt.setString(5, vo.getHhi_no2());
			pstmt.setString(6, vo.getHhi_no3());
			pstmt.setString(7, vo.getMdr_date());
			pstmt.setString(8, vo.getMdr_request());
			pstmt.registerOutParameter(9, Types.INTEGER);
			pstmt.executeUpdate();
			result = pstmt.getInt(9);
			System.out.println("RESULT: " + result);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}
	
	//입금 대기 상태
	public void onlinePayi1(PaymentVo vo) {
		ResultSet rs = null;
		//여기서  프로시저를 호출하는 식으로 결제를 한다.
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement pstmt = conn.prepareCall("{call memberPayi1(?,?,?,?,?,?,?)}");
			pstmt.setString(1, vo.getMdr_no());
			pstmt.setString(2, vo.getMem_no());
			pstmt.setString(3, vo.getHhi_no1());
			pstmt.setString(4, vo.getHhi_no2());
			pstmt.setString(5, vo.getHhi_no3());
			pstmt.setString(6, vo.getMc_no());
			pstmt.setString(7, vo.getUse_saved_money());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
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
	
	//import 입금실패.
	//결제내역을 보고, 차감된 쿠폰을 돌려주고, 마일리지를 원상복구 시킨뒤에 삭제시킨다.
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
