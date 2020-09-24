package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.SalesVo;

public class SalesDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static SalesDAO instance = null;

	public static SalesDAO getInstance() {
		if (instance == null)
			instance = new SalesDAO();
		return instance;
	}

	public ArrayList<SalesVo> period(SalesVo vo) {
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT mdp_code,  sum(mdp_price) FROM members_detail_paylist JOIN members_designer_rsv r USING(mdr_no) "
					+ " WHERE r.mdr_date between(TRUNC(to_date(?),'mm')) AND (LAST_DAY(?)) "
					+ " and r.mdr_status  = 'i3' GROUP BY mdp_code ORDER BY 1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "20-09-09");
			pstmt.setString(2, "20-09-29");
			System.out.println("sql" + sql);
			rs = pstmt.executeQuery();
			System.out.println("sql" + sql);
			while (rs.next()) {

				resultVo = new SalesVo();
				resultVo.setCode(rs.getString(1));
				resultVo.setSum(rs.getInt(2));
				list.add(resultVo);
				System.out.println(resultVo.getSum());
				System.out.println(resultVo.getCode());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
