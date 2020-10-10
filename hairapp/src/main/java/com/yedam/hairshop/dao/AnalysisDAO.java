package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.AnalysisVo;

public class AnalysisDAO {

	static Connection conn;
	PreparedStatement pstmt;

	static AnalysisDAO instance = null;

	public static AnalysisDAO getInstance() {
		if (instance == null)
			instance = new AnalysisDAO();
		return instance;
	}

	public ArrayList<AnalysisVo> countTotal(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT\n" + "    to_char(mdr_date, 'yy-mm') AS dat , \n" + "    COUNT(mdr_date) AS cnt\n"
				+ "FROM\n" + "    members_designer_rsv\n" + "WHERE\n"
				+ "    mdr_date BETWEEN add_months(to_date(?,'yyyy-mm'),-6) AND last_day(TO_DATE(?, 'yyyy-mm'))\n" + "GROUP BY\n"
				+ "    to_char(mdr_date, 'yy-mm')";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate());
			pstmt.setString(2, vo.getDate());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setDate(rs.getString("dat"));
				resultVo.setCnt(rs.getString("cnt"));
System.out.println("vo"+resultVo.getCnt());
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> countAgeByMale(AnalysisVo vo) {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<>();
		String sql = " SELECT\n" + "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1) AS age,\n"
				+ "    COUNT(m.mem_birth) AS cnt\n" + "FROM\n" + "    members_designer_rsv   r\n"
				+ "    JOIN members                m USING ( mem_no )\n" + "WHERE\n" + "    m.mem_sex = 'male'\n"
				+ "    AND mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))\n"
				+ "        AND mem_birth IS NOT NULL\n" + "GROUP BY\n"
				+ "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1)";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate() + "-01");
			pstmt.setString(2, vo.getDate() + "-01");
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setAge(rs.getString("age"));
				resultVo.setAge_cnt(rs.getString("cnt"));
				vo.setGender("male");
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> countAgeByFemale(AnalysisVo vo) {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		String sql = " SELECT\n" + "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1) AS age,\n"
				+ "    COUNT(m.mem_birth) AS cnt\n" + "FROM\n" + "    members_designer_rsv   r\n"
				+ "    JOIN members                m USING ( mem_no )\n" + "WHERE\n" + "    m.mem_sex = 'female'\n"
				+ "    AND mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))\n"
				+ "        AND mem_birth IS NOT NULL\n" + "GROUP BY\n"
				+ "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1)";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate() + "-01");
			pstmt.setString(2, vo.getDate() + "-01");
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setAge(rs.getString("age"));
				resultVo.setAge_cnt(rs.getString("cnt"));
				resultVo.setGender("female");
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> countGender(AnalysisVo vo) {
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		int n = 0;
		String sql = "SELECT\n" + "    m.mem_sex AS gender,\n" + "    COUNT(m.mem_sex) AS cnt\n" + "FROM\n"
				+ "    members_designer_rsv   r\n" + "    JOIN members  m USING ( mem_no )\n" + "WHERE\n"
				+ "    mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))\n" + "    AND mem_sex IS NOT NULL\n"
				+ "GROUP BY\n" + "    m.mem_sex";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate() + "-01");
			pstmt.setString(2, vo.getDate() + "-01");
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();

				resultVo.setGender(rs.getString("gender"));
				resultVo.setGender_cnt(rs.getString("cnt"));
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
