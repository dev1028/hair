package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.MembersCouponVo;

public class MembersCouponDAO {
	static Connection conn;
	PreparedStatement pstmt;
	
	static MembersCouponDAO instance = null;
	public static MembersCouponDAO getInstance() {
		if (instance == null)
			instance = new MembersCouponDAO();
		return instance;
	}
	
	public List<MembersCouponVo> selectListUnusedCoupon(MembersCouponVo vo){
		ResultSet rs = null;
		List<MembersCouponVo> list = new ArrayList<MembersCouponVo>();
		try {
			String sql =" SELECT mc.*, hc.hs_no, hc.hsc_name, hc.hsc_discount_rate, hc.hsc_maxdiscount_pay" + 
						" FROM members_coupon mc, hs_coupon hc " + 
						" WHERE mc.hsc_no = hc.hsc_no " + 
						" AND mc.mem_no = ? AND hs_no = ? " + 
						" AND sysdate BETWEEN mc.mc_issuedate and mc.mc_expiredate";
			
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getHs_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MembersCouponVo tmpVo = new MembersCouponVo();
				tmpVo.setMem_no(rs.getString("mem_no"));
				tmpVo.setMc_issuedate(rs.getString("mc_issuedate"));
				tmpVo.setMc_expiredate(rs.getString("mc_expiredate"));
				tmpVo.setMc_used(rs.getString("mc_used"));
				tmpVo.setMc_no(rs.getString("mc_no"));
				tmpVo.setHsc_no(rs.getString("hsc_no"));
				tmpVo.setHsc_name(rs.getString("hsc_name"));
				tmpVo.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				tmpVo.setHsc_maxdiscount_pay(rs.getString("hsc_maxdiscount_pay"));
				list.add(tmpVo);
			}		
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
//	public ArrayList<CouponVo> selectAll(CouponVo vo) {
//		ArrayList<CouponVo> list = new ArrayList<>();
//		try {
//			conn = ConnectionManager.getConnnect();
//
//			pstmt = conn.prepareStatement(selectAll);
//
//			rs = pstmt.executeQuery();
//			System.out.println("nqnasql");
//			while (rs.next()) {
//
//				CouponVo resultVo = new CouponVo();
//				resultVo.setHsc_no(rs.getString("hsc_no"));
//				resultVo.setHs_no(rs.getString("hs_no"));
//
//				resultVo.setHsc_name(rs.getString("HSC_NAME"));
//				resultVo.setHsc_issuedate(rs.getString("HSC_ISSUEDATE"));
//				resultVo.setHsc_expiredate(rs.getString("HSC_expiredate"));
//				resultVo.setHsc_coupon_quantity(rs.getString("HSC_coupon_quantity"));
//				resultVo.setHsc_discount_rate(rs.getString("HSC_DISCOUNT_RATE"));
//				resultVo.setHsc_maxdiscount_pay(rs.getString("HSC_MAXDISCOUNT_PAY"));
//
//				list.add(resultVo);
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			ConnectionManager.close(rs, pstmt, conn);
//		}
////		
////		for(SalesVo vo : list) {
////			System.out.println(vo.getHName());
////		}
//		return list;
//	}
}
