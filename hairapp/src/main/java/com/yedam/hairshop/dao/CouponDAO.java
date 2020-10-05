package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.CouponVo;

public class CouponDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static CouponDAO instance = null;
	final static String selectAll = "select * from hs_coupon";
	final static String insert = "insert into hs_coupon(HSC_NO,HS_NO,HSC_ISSUEDATE,HSC_EXPIREDATE,HSC_COUPON_QUANTITY,HSC_DISCOUNT_RATE,HSC_MAXDISCOUNT_PAY,HSC_NAME)"
			+ "values( hsc_seq.nextval(),?,?,?,?,?,?,?)";

	public static CouponDAO getInstance() {
		if (instance == null)
			instance = new CouponDAO();
		return instance;
	}

	public void insert(CouponVo vo) {

		try {
			// 1.DB연결
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(insert); // 예외처리
			pstmt.setString(1, vo.getHs_no());
			pstmt.setString(2, vo.getHsc_issuedate());
			pstmt.setString(3, vo.getHsc_expiredate());
			pstmt.setString(4, vo.getHsc_coupon_quantity());
			pstmt.setString(5, vo.getHsc_discount_rate());
			pstmt.setString(6, vo.getHsc_maxdiscount_pay());
			pstmt.setString(7, vo.getHsc_name());
			int r = pstmt.executeUpdate();
			// 3.결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결해제(DB에 접속 session수는 제한적 그래서 해제해야됨)
			ConnectionManager.close(conn);
		}
	}

	public ArrayList<CouponVo> selectAll(CouponVo vo) {
		ArrayList<CouponVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(selectAll);

			rs = pstmt.executeQuery();
			System.out.println("nqnasql");
			while (rs.next()) {

				CouponVo resultVo = new CouponVo();
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setHs_no(rs.getString("hs_no"));

				resultVo.setHsc_name(rs.getString("HSC_NAME"));
				resultVo.setHsc_issuedate(rs.getString("HSC_ISSUEDATE"));
				resultVo.setHsc_expiredate(rs.getString("HSC_expiredate"));
				resultVo.setHsc_coupon_quantity(rs.getString("HSC_coupon_quantity"));
				resultVo.setHsc_discount_rate(rs.getString("HSC_DISCOUNT_RATE"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("HSC_MAXDISCOUNT_PAY"));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
//		
//		for(SalesVo vo : list) {
//			System.out.println(vo.getHName());
//		}
		return list;
	}
}
