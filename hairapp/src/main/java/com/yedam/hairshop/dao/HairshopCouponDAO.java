package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.CouponVo;

public class HairshopCouponDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static HairshopCouponDAO instance;

	public static HairshopCouponDAO getInstance() {
		if (instance == null)
			instance = new HairshopCouponDAO();
		return instance;
	}
	
	//미용실 쿠폰 리스트
	public ArrayList<CouponVo> selectAll(){
		ArrayList<CouponVo> list = new ArrayList<CouponVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT HSC_NO, HS_NO, HSC_ISSUEDATE, HSC_EXPIREDATE, HSC_COUPON_QUANTITY"
					+ " HSC_DISCOUNT_RATE, HSC_MAXDISCOUNT_PAY, HSC_NAME"
					+ " FROM HS_COUPON";
			while(rs.next()) {
				pstmt = conn.prepareStatement(sql);
				//pstmt.setString(1, vo.getHs_no());
				rs = pstmt.executeQuery();
				CouponVo coupon = new CouponVo();
				coupon.setHsc_no(rs.getString("HSC_NO"));
				coupon.setHs_no(rs.getString("HS_NO"));
				coupon.setHsc_issuedate(rs.getString("HSC_ISSUEDATE"));
				coupon.setHsc_expiredate(rs.getString("HSC_EXPIREDATE"));
				coupon.setHsc_coupon_quantity(rs.getString("hsc_coupon_quantity"));
				coupon.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				coupon.setHsc_maxdiscount_pay(rs.getString("HSC_MAXDISCOUNT_PAY"));
				coupon.setHsc_name(rs.getString("HSC_NAME"));
				list.add(coupon);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
}
