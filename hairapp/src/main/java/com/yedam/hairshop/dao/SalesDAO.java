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

	final static String totaldaily = "SELECT r.mdr_no,  r.mdr_date,d.designer_name,m.mem_name, h.HHI_NAME,\r\n"
			+ "nvl\r\n" + "((\r\n" + "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d1' AND mdr_no=r.mdr_no),0) AS card,\r\n" + "nvl\r\n" + "((\r\n"
			+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d2' AND mdr_no=r.mdr_no),0) AS cash,\r\n" + "nvl\r\n" + "((\r\n"
			+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d3' AND mdr_no=r.mdr_no),0) AS kakao,\r\n" + "nvl\r\n" + "((\r\n"
			+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d6' AND mdr_no=r.mdr_no),0) AS ACCOUNT\r\n" + ",(\r\n" + "SELECT  sum(mdp_price) \r\n"
			+ "FROM members_detail_paylist\r\n" + "where mdr_no=r.mdr_no) as ammount\r\n" + "\r\n" + "FROM \r\n"
			+ "members_designer_rsv r \r\n" + "JOIN mem_designer_rsv_info i\r\n" + "ON(r.mdr_no = i.mdr_no)\r\n"
			+ "JOIN hairshop_hair_info h\r\n" + "ON(i.hhi_no=h.hhi_no)\r\n" + "JOIN designer  d \r\n"
			+ "ON (r.designer_no=d.designer_no)  \r\n" + "JOIN MEMBERs m\r\n" + "ON(m.mem_no = r.mem_no)\r\n"
			+ "WHERE r.mdr_date BETWEEN ?\r\n" + "AND  ?\r\n" + "and r.mdr_status  = 'i3' order by mdr_no ";

	public static SalesDAO getInstance() {
		if (instance == null)
			instance = new SalesDAO();
		return instance;
	}

	public ArrayList<SalesVo> dailySalesAll(String start, String end) {
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(totaldaily);
			pstmt.setString(1, start);
			pstmt.setString(2, end);

			rs = pstmt.executeQuery();
			System.out.println("sql");
			while (rs.next()) {
			
				resultVo = new SalesVo();
				resultVo.setMdrNo(rs.getString("mdr_no"));
				resultVo.setMdrDate(rs.getString("mdr_date"));
				resultVo.setDsName(rs.getString("designer_name"));
				resultVo.setMemName(rs.getString("mem_name"));
				resultVo.setHName(rs.getString("hhi_name"));
				resultVo.setCard(rs.getString("card"));
				resultVo.setCash(rs.getString("cash"));
				resultVo.setKakao(rs.getString("kakao"));
				resultVo.setAccount(rs.getString("account"));
				resultVo.setTotalAmountRsv(rs.getString("ammount"));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		
		for(SalesVo vo : list) {
			System.out.println(vo.getHName());
		}
		return list;
	}

	public ArrayList<SalesVo> daily(String start, String end) {
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

	public ArrayList<SalesVo> period(String start, String end) {
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
