package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignerVo;
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
	public ArrayList<SalesVo> dailySalesAll(String start, String end){
		
	}
	public ArrayList<SalesVo> daily (String start , String end) {
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT mdp_code,  sum(mdp_price) FROM members_detail_paylist JOIN members_designer_rsv r USING(mdr_no) "
					+ " WHERE r.mdr_date between ? AND ? ) "
					+ " and r.mdr_status  = 'i3' GROUP BY mdp_code ORDER BY 1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
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
	public ArrayList<SalesVo> monthly(SalesVo vo) {
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
	public ArrayList<SalesVo> period(String start , String end) {
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT mdp_code,  sum(mdp_price) FROM members_detail_paylist JOIN members_designer_rsv r USING(mdr_no) "
					+ " WHERE r.mdr_date between ? AND ? ) "
					+ " and r.mdr_status  = 'i3' GROUP BY mdp_code ORDER BY 1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
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
	public ArrayList<DesignerVo> getDsName() {
		ArrayList<DesignerVo> list = new ArrayList<>();
		DesignerVo resultVo = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT designer_no, designer_name	FROM designer  ";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new DesignerVo();
				resultVo.setDesigner_no(rs.getString(1));
				resultVo.setDesigner_name(rs.getString(2));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
