package com.yedam.hairshop.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignersLeaveInfoVo;
import com.yedam.hairshop.model.HairShopReviewVo;

public class HairShopReviewDAO {
	static HairShopReviewDAO instance;
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;
	
	static public HairShopReviewDAO getInstance() {
		if(instance == null)
			instance = new HairShopReviewDAO();
		return instance;
	}
	
	public void insertReview(HairShopReviewVo vo) {
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement cstmt = conn.prepareCall("{call insertHairShopReview(?, ?, ?, ?)}");
			cstmt.setString(1, vo.getMdr_no());
			cstmt.setString(2, vo.getHr_rate());
			cstmt.setString(3, vo.getHr_contents());
			cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
			cstmt.execute();
			
			int result = cstmt.getInt(4);
			System.out.println(result + "값 처리 됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	}
}
