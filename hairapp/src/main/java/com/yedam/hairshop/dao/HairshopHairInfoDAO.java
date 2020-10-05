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
	
	public List<HairshopHairInfoVo> getBookmarkList(){
		List<HairshopHairInfoVo> list = new ArrayList<HairshopHairInfoVo>();
		
		return list;
	}
}
