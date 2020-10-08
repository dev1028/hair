package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.SearchRankVo;
import com.yedam.hairshop.model.SearchVo;

public class HairshopHairInfoDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static HairshopHairInfoDAO instance;
	public static HairshopHairInfoDAO getInstance() {
		if(instance == null)
			instance = new HairshopHairInfoDAO();
		return instance;
	}
	
	public HairshopHairInfoVo selectHairInfo(HairshopHairInfoVo vo) {
		try {
			String sql  = 	" SELECT hi.hhi_no, hi.hhi_name, hi.hhi_price, hi.hhi_time, hi.hs_no" +
					" FROM hairshop_hair_info hi, hairshop hs " + 
					" WHERE hi.hs_no = hs.hs_no AND hi.hhi_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHhi_no());
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
	//헤어샵에 포함된 헤어정보 리스트
	public List<HairshopHairInfoVo> selectListHairshopHairInfo_InHairshop(HairshopVo hairshopVo){
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();

		try {
			String sql  = 	" SELECT hi.hhi_no, hi.hhi_name, hi.hhi_price, hi.hhi_time, hi.hs_no" +
					" FROM hairshop_hair_info hi, hairshop hs " + 
					" WHERE hi.hs_no = hs.hs_no AND hs.hs_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	
	public List<HairshopHairInfoVo> selectListRank(SearchRankVo vo){
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		try {
			String sql  = 	
					"SELECT d.*, d.rn, d.cnt, d.hhi_no, d.hhi_name, d.hhi_price, d.hhi_time, d.hs_no, d.tmic_no, d.distance, " +
					"                  NVL2((SELECT mem_no  " + 
					"                  FROM favor_hair " + 
					"                  WHERE hhi_no = d.hhi_no AND mem_no = ?), 1, 0) as book  " + 
					"FROM (SELECT rownum rn, k.*  " + 
					"      FROM (SELECT r.cnt,  " + 
					"                   h.*,  " + 
					"                   hs.hs_latlong, " + 
					"                   TRUNC(getDistance(?, ?, substr(HS_LATLONG, 0, instr(HS_LATLONG, ',')-1), substr(HS_LATLONG, instr(HS_LATLONG, ',')+1)), 2) as distance  " + 
					"            FROM (SELECT hhi_no, count(*) as cnt " + 
					"                  FROM favor_hair " + 
					"                  group by hhi_no) r " + 
					"            JOIN hairshop_hair_info h " + 
					"            ON h.hhi_no = r.hhi_no " + 
					"            JOIN hairshop hs " + 
					"            ON hs.hs_no = h.hs_no) k) d " + 
					"WHERE rn <= 10 ";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getLat());
			pstmt.setString(3, vo.getLng());
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
}
