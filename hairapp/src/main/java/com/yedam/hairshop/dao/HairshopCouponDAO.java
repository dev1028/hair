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

	// 싱글톤
	static HairshopCouponDAO instance;

	public static HairshopCouponDAO getInstance() {
		if (instance == null)
			instance = new HairshopCouponDAO();
		return instance;
	}

	// 미용실 쿠폰 리스트(+페이징처리)
	public ArrayList<CouponVo> selectAll(CouponVo couponVo) {
		System.out.println("쿠폰리스트1");
		ResultSet rs = null; // 초기화
		ArrayList<CouponVo> list = new ArrayList<CouponVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT A.* from (SELECT rownum rn,b.* from ("
					+ "SELECT HSC_NO, HS_NO, HSC_ISSUEDATE, HSC_EXPIREDATE, HSC_COUPON_QUANTITY, "
					+ " HSC_DISCOUNT_RATE, HSC_MAXDISCOUNT_PAY, HSC_NAME " + " FROM HS_COUPON " 
					+ " ) b ) a where rn between ? and ?";
			System.out.println("쿠폰리스트");
			pstmt = conn.prepareStatement(sql);
			int pos = 1; // 물음표값 동적으로 하려고 변수선언
			pstmt.setString(1, couponVo.getHs_no());
			System.out.println("헤어샵번호: " + couponVo.getHs_no());
			pstmt.setInt(pos++, couponVo.getFirst()); // 물음표부분이 pos++로 인해 동적으로 늘어남
			pstmt.setInt(pos++, couponVo.getLast());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CouponVo resultVo = new CouponVo();
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setHs_no(rs.getString("hs_no"));
				resultVo.setHsc_issuedate((rs.getString("hsc_issuedate")).substring(0,10));
				resultVo.setHsc_expiredate((rs.getString("hsc_expiredate")).substring(0,10));
				resultVo.setHsc_coupon_quantity(rs.getString("HSC_COUPON_QUANTITY"));
				resultVo.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("hsc_maxdiscount_pay"));
				resultVo.setHsc_name(rs.getString("hsc_name"));
				
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 전체 건수
	public int count(CouponVo couponVo) {
		ResultSet rs = null; // 초기화
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select count(*) from hs_coupon ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}

	//쿠폰등록
	public void insert(CouponVo couponVo) {
		ResultSet rs = null; // 초기화
		int r =0;
		try {
			System.out.println("쿠폰등록");
			conn= ConnectionManager.getConnnect();
			String sql = "INSERT INTO HS_COUPON (HSC_NO ,HS_NO, HSC_ISSUEDATE, HSC_EXPIREDATE, "
					+ " HSC_COUPON_QUANTITY, HSC_DISCOUNT_RATE, HSC_MAXDISCOUNT_PAY, HSC_NAME  )"
					+ " VALUES(HSC_NO_SEQ.NEXTVAL ,?, ?, ?, ?, ?, ?, ? ) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, couponVo.getHs_no());
			pstmt.setString(2, couponVo.getHsc_issuedate());
			pstmt.setString(3, couponVo.getHsc_expiredate());
			pstmt.setString(4, couponVo.getHsc_coupon_quantity());
			pstmt.setString(5, couponVo.getHsc_discount_rate());
			pstmt.setString(6, couponVo.getHsc_maxdiscount_pay());
			pstmt.setString(7, couponVo.getHsc_name());
			
			r = pstmt.executeUpdate();
			
			System.out.println(r +"건 처리됨");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return ;
	}
}
