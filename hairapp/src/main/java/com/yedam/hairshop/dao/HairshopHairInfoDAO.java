package com.yedam.hairshop.dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.SearchRankVo;

public class HairshopHairInfoDAO {
	static Connection conn;
	PreparedStatement pstmt;

	static HairshopHairInfoDAO instance;

	public static HairshopHairInfoDAO getInstance() {
		if (instance == null)
			instance = new HairshopHairInfoDAO();
		return instance;
	}

	public HairshopHairInfoVo selectHairInfo(HairshopHairInfoVo vo) {
		ResultSet rs = null;
		try {
			String sql = " SELECT hi.hhi_no, hi.hhi_name, hi.hhi_price, hi.hhi_time, hi.hs_no"
					+ " FROM hairshop_hair_info hi, hairshop hs " + " WHERE hi.hs_no = hs.hs_no AND hi.hhi_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHhi_no());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				HairshopHairInfoVo resultVo = new HairshopHairInfoVo();
				resultVo.setHhi_no(rs.getString(1));
				resultVo.setHhi_name(rs.getString(2));
				resultVo.setHhi_price(rs.getString(3));
				resultVo.setHhi_time(rs.getString(4));
				resultVo.setHs_no(rs.getString(5));
				return resultVo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return null;
	}
	
	//2020.10.11 김승연
	//시술명 중복체크
	public List<HairshopHairInfoVo> selectHairInfoByName(HairshopHairInfoVo vo) {
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		ResultSet rs = null;
		try {
			String sql = " SELECT hi.hhi_no, hi.hhi_name, hi.hhi_price, hi.hhi_time, hi.hs_no"
					+ " FROM hairshop_hair_info hi, hairshop hs " + " WHERE hi.hs_no = ? AND hi.HHI_STATUS = 1 AND hi.hhi_name = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			pstmt.setString(2, vo.getHhi_name());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo resultVo = new HairshopHairInfoVo();
				resultVo.setHhi_no(rs.getString(1));
				resultVo.setHhi_name(rs.getString(2));
				resultVo.setHhi_price(rs.getString(3));
				resultVo.setHhi_time(rs.getString(4));
				resultVo.setHs_no(rs.getString(5));
				list.add(resultVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 헤어샵에 포함된 헤어정보 리스트
	public List<HairshopHairInfoVo> selectListHairshopHairInfo_InHairshop(HairshopVo hairshopVo, String status) {
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		ResultSet rs = null;
		try {
			String sql = " SELECT hi.hhi_no, hi.hhi_name, hi.hhi_price, hi.hhi_time, hi.hs_no"
					+ " FROM hairshop_hair_info hi, hairshop hs " + " WHERE hi.hs_no = hs.hs_no AND hs.hs_no = ? "
					+ " AND hi.hhi_status = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			pstmt.setString(2, status);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo vo = new HairshopHairInfoVo();
				vo.setHhi_no(rs.getString(1));
				vo.setHhi_name(rs.getString(2));
				vo.setHhi_price(rs.getString(3));
				vo.setHhi_time(rs.getString(4));
				vo.setHs_no(rs.getString(5));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

	public List<HairshopHairInfoVo> getBookmarkList(String memNo) {
		ResultSet rs = null;
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		String sql = " SELECT h.hhi_no, h.hhi_name, h.hhi_price, h.hhi_time, h.hs_no, h.hhi_status "
				+ " FROM hairshop_hair_info h, favor_hair f " + " WHERE h.hhi_no = f.hhi_no " + " AND f.mem_no = ? ";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo tmpVo = new HairshopHairInfoVo();
				tmpVo.setHhi_no(rs.getString("hhi_no"));
				tmpVo.setHhi_name(rs.getString("hhi_name"));
				tmpVo.setHhi_price(rs.getString("hhi_price"));
				tmpVo.setHhi_time(rs.getString("hhi_time"));
				tmpVo.setHs_no(rs.getString("hs_no"));
				tmpVo.setHhi_status(rs.getString("hhi_status"));
				list.add(tmpVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
	}

	// 2020.10.08 김승연
	// 헤어샵에 포함된 헤어정보 리스트(중분류,대분류 포함)
	public List<HairshopHairInfoVo> selectHairInfoList(HairshopHairInfoVo hsHIVo) {
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		ResultSet rs = null;
		try {
			String sql = "select t.TMAC_NO, t.TMAC_NAME, t.TMAC_EXPLICATION, tmi.TMIC_NO, tmi.TMIC_NAME,"
					+ " tmi.TMIC_EXPLICATION, h.HHI_NO, h.HHI_NAME, h.HHI_PRICE, h.HHI_TIME, h.HS_NO, h.HHI_STATUS"
					+ " from hairshop_hair_info h join tt_middle_category tmi" + " on (h.tmic_no = tmi.tmic_no)"
					+ " join tt_main_category t" + " on (tmi.TMAC_NO = t.TMAC_NO)" + " where h.hs_no = ?"
					+ " order by hhi_no";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsHIVo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo hVo = new HairshopHairInfoVo();
				hVo.setTmac_no(rs.getString("TMAC_NO"));
				hVo.setTmac_name(rs.getString("TMAC_NAME"));
				hVo.setTmac_explication(rs.getString("TMAC_EXPLICATION"));
				hVo.setTmic_no(rs.getString("TMIC_NO"));
				hVo.setTmic_name(rs.getString("TMIC_NAME"));
				hVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				hVo.setHhi_no(rs.getString("HHI_NO"));
				hVo.setHhi_name(rs.getString("HHI_NAME"));
				hVo.setHhi_price(rs.getString("HHI_PRICE"));
				hVo.setHhi_time(rs.getString("HHI_TIME"));
				hVo.setHs_no(rs.getString("HS_NO"));
				hVo.setHhi_status(rs.getString("HHI_STATUS"));
				//hVo.setHhmi_file(rs.getString("HHMI_FILE"));
				list.add(hVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

	public List<HairshopHairInfoVo> selectHairInfoListWithFileName(HairshopHairInfoVo hsHIVo) {
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		ResultSet rs = null;
		try {
			String sql = 
				"SELECT t.TMAC_NO, t.TMAC_NAME, t.TMAC_EXPLICATION,\r\n" + 
				"       tmi.TMIC_NO, tmi.TMIC_NAME, tmi.TMIC_EXPLICATION,\r\n" + 
				"       h.HHI_NO, h.HHI_NAME, h.HHI_PRICE, h.HHI_TIME, h.HS_NO, h.HHI_STATUS,\r\n" + 
				"       hmi.hhmi_file\r\n" + 
				"FROM hairshop_hair_info h \r\n" + 
				"JOIN tt_middle_category tmi ON (h.tmic_no = tmi.tmic_no)\r\n" + 
				"JOIN tt_main_category t ON (tmi.TMAC_NO = t.TMAC_NO)\r\n" + 
				"JOIN hairshop_hair_more_info hmi ON (hmi.hhi_no = h.hhi_no)\r\n" + 
				"WHERE h.hs_no = ?\r\n" + 
				"ORDER BY hhi_no";
			
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsHIVo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo hVo = new HairshopHairInfoVo();
				hVo.setTmac_no(rs.getString("TMAC_NO"));
				hVo.setTmac_name(rs.getString("TMAC_NAME"));
				hVo.setTmac_explication(rs.getString("TMAC_EXPLICATION"));
				hVo.setTmic_no(rs.getString("TMIC_NO"));
				hVo.setTmic_name(rs.getString("TMIC_NAME"));
				hVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				hVo.setHhi_no(rs.getString("HHI_NO"));
				hVo.setHhi_name(rs.getString("HHI_NAME"));
				hVo.setHhi_price(rs.getString("HHI_PRICE"));
				hVo.setHhi_time(rs.getString("HHI_TIME"));
				hVo.setHs_no(rs.getString("HS_NO"));
				hVo.setHhi_status(rs.getString("HHI_STATUS"));
				hVo.setHhmi_file(rs.getString("HHMI_FILE"));
				list.add(hVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
	
		return list;
	}
	
	// 2020.10.08 김승연
	// 헤어샵에 포함된 헤어정보 리스트(중분류,대분류 포함) 검색조건포함
	public List<HairshopHairInfoVo> selectHairInfoListForSer(String divisionSearch, HairshopHairInfoVo hsHIVo) {
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		ResultSet rs = null;
		String andhHhiName = " and h.HHI_NAME like '%'||?||'%'";
		String andTmiName = " and t.TMAC_NAME like '%'||?||'%'";
		String orderBy = " order by h.hhi_no";
		try {
			String sql = "select t.TMAC_NO, t.TMAC_NAME, t.TMAC_EXPLICATION, tmi.TMIC_NO, tmi.TMIC_NAME,"
					+ " tmi.TMIC_EXPLICATION, h.HHI_NO, h.HHI_NAME, h.HHI_PRICE, h.HHI_TIME, h.HS_NO, h.HHI_STATUS"
					+ " from hairshop_hair_info h join tt_middle_category tmi" + " on (h.tmic_no = tmi.tmic_no)"
					+ " join tt_main_category t" + " on (tmi.TMAC_NO = t.TMAC_NO)" + " where h.hs_no = ?";
			if (divisionSearch.equals("hhi_name")) {
				sql += (andhHhiName + orderBy);
			} else {
				sql += (andTmiName + orderBy);
			}
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsHIVo.getHs_no());
			if (divisionSearch.equals("hhi_name")) {
				pstmt.setString(2, hsHIVo.getHhi_name());
			} else {
				pstmt.setString(2, hsHIVo.getTmac_name());
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo hVo = new HairshopHairInfoVo();
				hVo.setTmac_no(rs.getString("TMAC_NO"));
				hVo.setTmac_name(rs.getString("TMAC_NAME"));
				hVo.setTmac_explication(rs.getString("TMAC_EXPLICATION"));
				hVo.setTmic_no(rs.getString("TMIC_NO"));
				hVo.setTmic_name(rs.getString("TMIC_NAME"));
				hVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				hVo.setHhi_no(rs.getString("HHI_NO"));
				hVo.setHhi_name(rs.getString("HHI_NAME"));
				hVo.setHhi_price(rs.getString("HHI_PRICE"));
				hVo.setHhi_time(rs.getString("HHI_TIME"));
				hVo.setHs_no(rs.getString("HS_NO"));
				hVo.setHhi_status(rs.getString("HHI_STATUS"));
				list.add(hVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

	// 2020.10.08 김승연
	// 헤어정보단건조회
	public HairshopHairInfoVo selectOneHairInfo(HairshopHairInfoVo hsHIVo) {
		HairshopHairInfoVo hVo = new HairshopHairInfoVo();
		ResultSet rs = null;
		try {
			String sql = "select t.TMAC_NO, t.TMAC_NAME, t.TMAC_EXPLICATION, tmi.TMIC_NO, tmi.TMIC_NAME,"
					+ " tmi.TMIC_EXPLICATION, h.HHI_NO, h.HHI_NAME, h.HHI_PRICE, h.HHI_TIME, h.HS_NO, h.HHI_STATUS"
					+ " from hairshop_hair_info h join tt_middle_category tmi" + " on (h.tmic_no = tmi.tmic_no)"
					+ " join tt_main_category t" + " on (tmi.TMAC_NO = t.TMAC_NO)" + " where h.hhi_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsHIVo.getHhi_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				hVo.setTmac_no(rs.getString("TMAC_NO"));
				hVo.setTmac_name(rs.getString("TMAC_NAME"));
				hVo.setTmac_explication(rs.getString("TMAC_EXPLICATION"));
				hVo.setTmic_no(rs.getString("TMIC_NO"));
				hVo.setTmic_name(rs.getString("TMIC_NAME"));
				hVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				hVo.setHhi_no(rs.getString("HHI_NO"));
				hVo.setHhi_name(rs.getString("HHI_NAME"));
				hVo.setHhi_price(rs.getString("HHI_PRICE"));
				hVo.setHhi_time(rs.getString("HHI_TIME"));
				hVo.setHs_no(rs.getString("HS_NO"));
				hVo.setHhi_status(rs.getString("HHI_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return hVo;
	}

	public List<HairshopHairInfoVo> selectListRank(SearchRankVo vo) {
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		ResultSet rs = null;
		try {
			String sql = 
					"SELECT d.*, d.rn, d.cnt, d.hhi_no, d.hhi_name, d.hhi_price, d.hhi_time, d.hs_no, d.tmic_no, d.distance, d.hhmi_file,\r\n" + 
					"                  NVL2((SELECT mem_no FROM favor_hair\r\n" + 
					"                  WHERE hhi_no = d.hhi_no AND mem_no = ?), 1, 0) as book  \r\n" + 
					"FROM (SELECT rownum rn, k.*  \r\n" + 
					"      FROM (SELECT r.cnt,  h.*, hhmi.hhmi_file, hs.hs_latlong, \r\n" + 
					"            TRUNC(getDistance(?, ?, substr(HS_LATLONG, 0, instr(HS_LATLONG, ',')-1), substr(HS_LATLONG, instr(HS_LATLONG, ',')+1)), 2) as distance  \r\n" + 
					"            FROM (SELECT hhi_no, count(*) as cnt \r\n" + 
					"                  FROM favor_hair \r\n" + 
					"                  group by hhi_no) r  \r\n" + 
					"            JOIN hairshop_hair_info h \r\n" + 
					"            ON h.hhi_no = r.hhi_no\r\n" + 
					"            LEFT OUTER JOIN hairshop_hair_more_info hhmi\r\n" + 
					"            ON hhmi.hhi_no = h.hhi_no\r\n" + 
					"            JOIN hairshop hs \r\n" + 
					"            ON hs.hs_no = h.hs_no) k) d \r\n" + 
					"      WHERE rn <= 10";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getLat());
			pstmt.setString(3, vo.getLng());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopHairInfoVo tmpVo = new HairshopHairInfoVo();
				tmpVo.setRn(rs.getString("rn"));
				tmpVo.setHhi_no(rs.getString("hhi_no"));
				tmpVo.setHhi_name(rs.getString("hhi_name"));
				tmpVo.setHhi_price(rs.getString("hhi_price"));
				tmpVo.setHhi_time(rs.getString("hhi_time"));
				tmpVo.setHs_no(rs.getString("hs_no"));
				tmpVo.setTmic_no(rs.getString("tmic_no"));
				tmpVo.setDistance(rs.getString("distance"));
				tmpVo.setHhi_book(rs.getString("book"));
				tmpVo.setHhmi_file(rs.getString("hhmi_file"));
				list.add(tmpVo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 2020.10.10 김승연
	// 미용실 헤어 상태변경
	public int updateHhiStatus(HairshopHairInfoVo hHIVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE HAIRSHOP_HAIR_INFO SET HHI_STATUS = ? WHERE HHI_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(hHIVo.getHhi_status()));
			pstmt.setInt(2, Integer.parseInt(hHIVo.getHhi_no()));
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}


	// 2020.10.10 김승연
	// 미용실 헤어 입력 프로시저(사진있거나 없거나 둘다 가능)
	public HairshopHairInfoVo insertHhi(HairshopHairInfoVo hHIVo) {
		HairshopHairInfoVo hVo = new HairshopHairInfoVo();
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement pstmt = conn.prepareCall("{call hhi_insert(?,?,?,?,?,?,?,?)}");
			pstmt.registerOutParameter(1, Types.VARCHAR);
			pstmt.registerOutParameter(2, Types.VARCHAR);
			pstmt.setString(2, hHIVo.getHhi_name());
			pstmt.registerOutParameter(3, Types.VARCHAR);
			pstmt.setString(3, hHIVo.getHhi_price());
			pstmt.registerOutParameter(4, Types.VARCHAR);
			pstmt.setString(4, hHIVo.getHhi_time());
			pstmt.registerOutParameter(5, Types.VARCHAR);
			pstmt.setString(5, hHIVo.getHs_no());
			pstmt.registerOutParameter(6, Types.VARCHAR);
			pstmt.setString(6, hHIVo.getTmic_no());
			pstmt.registerOutParameter(7, Types.VARCHAR);
			pstmt.setString(7, hHIVo.getHhi_status());
			pstmt.registerOutParameter(8, Types.VARCHAR);
			pstmt.setString(8, hHIVo.getHhmi_file());
			pstmt.executeUpdate();
			hVo.setHhi_no(pstmt.getString(1));
			hVo.setHhi_name(pstmt.getString(2));
			hVo.setHhi_price(pstmt.getString(3));
			hVo.setHhi_time(pstmt.getString(4));
			hVo.setHs_no(pstmt.getString(5));
			hVo.setTmic_name(pstmt.getString(6));
			hVo.setHhi_status(pstmt.getString(7));
			hVo.setHhmi_file(pstmt.getString(8));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn);
		}
		return hVo;
	}

}
