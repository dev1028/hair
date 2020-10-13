package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.MembersDetailPaylistVo;
import com.yedam.hairshop.model.SalesVo;

public class SalesDAO {
	static Connection conn;
	PreparedStatement pstmt;

	static SalesDAO instance = null;

	final static String totaldaily = "SELECT r.mdr_no,  r.mdr_date,d.designer_name,m.mem_name, h.HHI_NAME,\r\n"
			+ "nvl\r\n" + "((\r\n" + "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d1' AND mdr_no=r.mdr_no),0) AS card,\r\n" + "nvl\r\n" + "((\r\n"
			+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d2' AND mdr_no=r.mdr_no),0) AS cash,\r\n" + "nvl\r\n" + "((\r\n"
			+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d3' AND mdr_no=r.mdr_no),0) AS kakao,\r\n" + "nvl\r\n" + "((\r\n"
			+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
			+ "WHERE mdp_code='d6' AND mdr_no=r.mdr_no),0) AS ACCOUNT\r\n" + ",(\r\n"
			+ "SELECT  nvl(sum(mdp_price),0) \r\n" + "FROM members_detail_paylist\r\n"
			+ "where mdr_no=r.mdr_no) as ammount\r\n" + "\r\n" + "FROM \r\n" + "members_designer_rsv r \r\n"
			+ "JOIN mem_designer_rsv_info i\r\n" + "ON(r.mdr_no = i.mdr_no)\r\n" + "JOIN hairshop_hair_info h\r\n"
			+ "ON(i.hhi_no=h.hhi_no)\r\n" + "JOIN designer  d \r\n" + "ON (r.designer_no=d.designer_no)  \r\n"
			+ "JOIN MEMBERs m\r\n" + "ON(m.mem_no = r.mem_no)\r\n" + "WHERE r.mdr_date BETWEEN ?\r\n" + "AND  ?\r\n"
			+ "and r.mdr_status  = 'i4' and hs_no=?  ";
	final static String addDs = " and r.designer_no=? order by mdr_no ";
	final static String chart = "\r\n" + "SELECT   d.designer_no,sum(\r\n"
			+ "			 (   SELECT  nvl(sum(mdp_price),0)  \r\n" + "				 FROM members_detail_paylist   \r\n"
			+ "				 WHERE mdr_no=r.mdr_no\r\n" + "			 and r.mdr_date between to_char(sysdate,'yy-mm-dd') and to_char(sysdate+1,'yy-mm-dd') \r\n"
			+ "				 ))as ammount     	 \r\n" + "FROM  \r\n" + "	members_designer_rsv r   \r\n"
			+ "JOIN designer  d  \r\n" + " ON (r.designer_no=d.designer_no)\r\n" + " where d.hs_no = ?  and d.DESIGNER_ACCESS_STATUS=1\r\n"
			+ " GROUP BY d.designer_no";

	public static SalesDAO getInstance() {
		if (instance == null)
			instance = new SalesDAO();
		return instance;
	}

	public List<Map<String, String>> chart(String hs_no) {
		ResultSet rs = null;
		ArrayList<SalesVo> list = dsList(hs_no);
		ArrayList<SalesVo> list1 = new ArrayList<>();

		SalesVo resultVo = null;
		Date date = new Date();

		System.out.println(date);
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(chart);
			pstmt.setString(1, hs_no);
//			pstmt.setString(2, date.toString());

			rs = pstmt.executeQuery();
			System.out.println("sql");
			while (rs.next()) {

				resultVo = new SalesVo();

				resultVo.setDsNo(rs.getString("designer_no"));
				resultVo.setTotalAmountRsv(rs.getString("ammount"));

				list1.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		for (SalesVo va : list1) {
			for (int i = 0; i < list.size(); i++) {
				if (va.getDsNo().equals(list.get(i).getDsNo())) {
					list.get(i).setTotalAmountRsv(va.getTotalAmountRsv());
					break;
				}
			}

		}
		List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
		for (SalesVo vovo : list) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("ammount", vovo.getTotalAmountRsv());
			map.put("name", vovo.getDsName());
			mapList.add(map);
		}

		return mapList;
	}

	public ArrayList<SalesVo> dailySalesAll(String start, String end, String hs_no) {
		ResultSet rs = null;
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(totaldaily);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			pstmt.setString(3, hs_no);
			rs = pstmt.executeQuery();
			System.out.println(totaldaily);
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

		for (SalesVo vo : list) {
			System.out.println(vo.getHName());
		}
		return list;
	}

	public ArrayList<SalesVo> dailySalesByDesigner(String start, String end, String ds_no) {
		ResultSet rs = null;
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;
		String sql = "SELECT r.mdr_no,  r.mdr_date,d.designer_name,m.mem_name, h.HHI_NAME,\r\n" + "nvl\r\n" + "((\r\n"
				+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
				+ "WHERE mdp_code='d1' AND mdr_no=r.mdr_no),0) AS card,\r\n" + "nvl\r\n" + "((\r\n"
				+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
				+ "WHERE mdp_code='d2' AND mdr_no=r.mdr_no),0) AS cash,\r\n" + "nvl\r\n" + "((\r\n"
				+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
				+ "WHERE mdp_code='d3' AND mdr_no=r.mdr_no),0) AS kakao,\r\n" + "nvl\r\n" + "((\r\n"
				+ "SELECT  mdp_price\r\n" + "FROM members_detail_paylist\r\n"
				+ "WHERE mdp_code='d6' AND mdr_no=r.mdr_no),0) AS ACCOUNT\r\n" + ",(\r\n"
				+ "SELECT  nvl(sum(mdp_price),0) \r\n" + "FROM members_detail_paylist\r\n"
				+ "where mdr_no=r.mdr_no) as ammount\r\n" + "\r\n" + "FROM \r\n" + "members_designer_rsv r \r\n"
				+ "JOIN mem_designer_rsv_info i\r\n" + "ON(r.mdr_no = i.mdr_no)\r\n" + "JOIN hairshop_hair_info h\r\n"
				+ "ON(i.hhi_no=h.hhi_no)\r\n" + "JOIN designer  d \r\n" + "ON (r.designer_no=d.designer_no)  \r\n"
				+ "JOIN MEMBERs m\r\n" + "ON(m.mem_no = r.mem_no)\r\n" + "WHERE r.mdr_date BETWEEN ?\r\n" + "AND  ?\r\n"
				+ "and r.mdr_status  = 'i4' and r.designer_no=? order by mdr_no ";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			pstmt.setString(3, ds_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new SalesVo();
				resultVo.setDsNo(ds_no);

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

		return list;
	}

	public ArrayList<SalesVo> dailySalesAllAddDs(String start, String end, String ds_no, String hs_no) {
		ResultSet rs = null;
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(totaldaily + addDs);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			pstmt.setString(3, hs_no);
			pstmt.setString(4, ds_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new SalesVo();
				resultVo.setDsNo(ds_no);

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

		for (SalesVo vo : list) {
			System.out.println(vo.getHName());
		}
		return list;
	}

	public ArrayList<DesignerVo> getDsName(String hs_no) {
		ResultSet rs = null;
		ArrayList<DesignerVo> list = new ArrayList<>();
		DesignerVo resultVo = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT designer_no, designer_name	FROM designer  where hs_no = ?  and designer_access_status =1 order by designer_no  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hs_no);
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

	public String getdsList(String ds_no) {
		String name = "";
		ResultSet rs = null;
		ArrayList<SalesVo> list = new ArrayList<>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT  designer_name	FROM designer  where designer_no = ? and designer_access_status =1 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ds_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				name = rs.getString(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return name;
	}

	public ArrayList<SalesVo> dsList(String hs_no) {

		ResultSet rs = null;
		ArrayList<SalesVo> list = new ArrayList<>();
		SalesVo resultVo = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT designer_no, designer_name	FROM designer  where hs_no = ? and designer_access_status =1 order by designer_no  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hs_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new SalesVo();
				resultVo.setDsNo(rs.getString(1));
				resultVo.setDsName(rs.getString(2));
				resultVo.setTotalAmountRsv("0");

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 2020.10.06 김승연
	// 예약번호를 이용한 매출 다건 조회
	public ArrayList<MembersDetailPaylistVo> selectListByMdrNo(MembersDetailPaylistVo mDPVo) {
		ResultSet rs = null;
		ArrayList<MembersDetailPaylistVo> list = new ArrayList<MembersDetailPaylistVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT MDP_NO,MDR_NO,MDP_PRICE,MDP_RV_SCENE,MDP_CODE" + " FROM MEMBERS_DETAIL_PAYLIST"
					+ " WHERE MDR_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDPVo.getMdr_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MembersDetailPaylistVo resultVo = new MembersDetailPaylistVo();
				resultVo.setMdp_no(rs.getString("MDP_NO"));
				resultVo.setMdr_no(rs.getString("MDR_NO"));
				resultVo.setMdp_price(rs.getString("MDP_PRICE"));
				resultVo.setMdp_rv_scene(rs.getString("MDP_RV_SCENE"));
				resultVo.setMdp_code(rs.getString("MDP_CODE"));
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
