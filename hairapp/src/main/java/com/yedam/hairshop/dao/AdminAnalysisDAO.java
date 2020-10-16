package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.AnalysisVo;

public class AdminAnalysisDAO {
	static Connection conn;
	PreparedStatement pstmt;

	static AdminAnalysisDAO instance = null;

	public static AdminAnalysisDAO getInstance() {
		if (instance == null)
			instance = new AdminAnalysisDAO();
		return instance;
	}

	public ArrayList<AnalysisVo> hairshopRateRank(AnalysisVo vo) {
		ResultSet rs = null;

		String sql = "SELECT\n" + "  h.hs_name, h.hs_no, \n" + "    round(nvl(avg((\n" + "        SELECT\n"
				+ "            avg(hr_rate)\n" + "        FROM\n" + "            hairshop_reviews\n" + "        WHERE\n"
				+ "            mdr_no = r.mdr_no  and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =?  \n"
				+ "    )), 0)) AS rate,\n" + "    RANK() OVER(\n" + "        ORDER BY\n"
				+ "           round( nvl(avg((\n" + "        SELECT\n" + "         avg(hr_rate)\n" + "        FROM\n"
				+ "            hairshop_reviews\n" + "        WHERE\n"
				+ "            mdr_no = r.mdr_no   and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =?  \n"
				+ "    )), 0) )DESC\n" + "    ) AS rank\n" + "FROM\n" + "    members_designer_rsv   r "
				+ "    join hairshop h ON(r.hs_no=h.hs_no)\n" +
				"WHERE\n"
				+ "   r. mdr_status IN (\n" + "        'i3',\n" + "        'i4')\n"+
				"GROUP BY\n" + "    h.hs_name, h.hs_no";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMonth());
			pstmt.setString(2, vo.getMonth());

			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				// resultVo.setPrevrank(rs.getString("prevrank"));
				resultVo.setRate(rs.getString("rate"));
				resultVo.setHs_name(rs.getString("hs_name"));
				// resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setHs_no(rs.getString("hs_no"));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> hairshopSalesRank(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT\n" + "   h.hs_name, h.hs_no,\n" + "    SUM((\n" + "        SELECT\n"
				+ "            nvl(SUM(mdp_price), 0)\n" + "        FROM\n" + "            members_detail_paylist\n"
				+ "        WHERE\n"
				+ "            mdr_no = r.mdr_no and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \n"
				+ "    )) AS sales,\n" + "    RANK() OVER(\n" + "        ORDER BY\n" + "            SUM((\n"
				+ "                SELECT\n" + "                    nvl(SUM(mdp_price), 0)\n" + "                FROM\n"
				+ "                    members_detail_paylist\n" + "                WHERE\n"
				+ "                    mdr_no = r.mdr_no and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \n"
				+ "            )) DESC\n" + "    ) AS rank\n" + "FROM\n" + "    members_designer_rsv  r "
				+ "    join hairshop h  ON(r.hs_no=h.hs_no)\n" + "WHERE\n"
				+ "    r.mdr_status IN (\n" + "        'i3',\n" + "        'i4')\n"+

				"GROUP BY\n" + "   h.hs_name, h.hs_no";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMonth());
			pstmt.setString(2, vo.getMonth());

			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				resultVo.setSales(rs.getString("sales"));
				resultVo.setHs_name(rs.getString("hs_name"));
				// resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setHs_no(rs.getString("hs_no"));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> hairshopRsvRank(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT h.hs_name, h.hs_no,  count(*) as rsv ,rank() over (order by count(*) desc) rank\r\n"
				+ "FROM hairshop h \r\n" + "JOIN members_designer_rsv r ON(r.hs_no=h.hs_no)\r\n" + "\r\n"
				+ "WHERE  substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \r\n" + "and \n"
				+ "    r.mdr_status IN (\n" + "        'i3',\n" + "        'i4')\n"+"group by h.hs_name, h.hs_no";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getDate());
			pstmt.setString(1, vo.getMonth());
			// pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				resultVo.setRsv(rs.getString("rsv"));
				// resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setHs_name(rs.getString("hs_name"));
				// resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setHs_no(rs.getString("hs_no"));
				// System.out.println("vo" + resultVo.getCnt());
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> reservationRank(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT\n" + "    h.hs_name,\n" + "    SUM(p.mdp_price) AS sales,\n" + "    COUNT(*) as cnt,\n"
				+ "    RANK() OVER(\n" + "        ORDER BY\n" + "            COUNT(*) DESC, SUM(p.mdp_price) DESC\n"
				+ "    ) rank\n" + "FROM\n" + "    hairshop                 h\n"
				+ "    JOIN members_designer_rsv     r ON ( h.hs_no = r.hs_no )\n"
				+ "    LEFT OUTER JOIN members_detail_paylist   p ON ( r.mdr_no = p.mdr_no )\n" + "WHERE\n"
				+ "    mdr_status IN (\n" + "        'i3',\n" + "        'i4')\n" + "and\n"
				+ "    mdr_date BETWEEN TO_DATE(?, 'yyyy-mm') AND last_day(TO_DATE(?, 'yyyy-mm'))\n" + "    \n"
				+ "GROUP BY\n" + "    h.hs_name";
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
				resultVo.setSales(rs.getString("sales"));
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setHs_name(rs.getString("hs_name"));
				resultVo.setRank(rs.getString("rank"));
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> newHairshop() {
		ResultSet rs = null;
		String sql = "    select to_char(hs_regdate,'yy-mm') as d ,COUNT(hs_regdate) AS cnt\n" + "FROM\n"
				+ "    hairshop\n" + "WHERE\n" + "    hs_regdate BETWEEN add_months(sysdate\n"
				+ "    , - 6) AND last_day(sysdate)\n" + "GROUP BY\n" + "    to_char(hs_regdate, 'yy-mm')";
		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setDate(rs.getString("d"));
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 남녀 통합 통계
	public ArrayList<AnalysisVo> rankByTreat() {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<>();
		String sql = "SELECT rownum rn, l.cnt, l.hhi_name, l.hhmi_file "
				+ "        FROM (SELECT k.cnt, hhi.hhi_name, hhmi.hhmi_file\r\n"
				+ "              FROM (SELECT hhi_no, count(hhi_no) as cnt\r\n"
				+ "                    FROM mem_designer_rsv_info mdri\r\n"
				+ "                    group by hhi_no) k\r\n" + "              JOIN hairshop_hair_info hhi\r\n"
				+ "              ON hhi.hhi_no = k.hhi_no\r\n"
				+ "              LEFT OUTER JOIN hairshop_hair_more_info hhmi\r\n"
				+ "              ON hhi.hhi_no = hhmi.hhi_no\r\n" + "              ORDER BY cnt DESC) l";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rn"));
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setHhi_name(rs.getString("hhi_name"));
				resultVo.setFile_name(rs.getString("hhmi_file"));
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
