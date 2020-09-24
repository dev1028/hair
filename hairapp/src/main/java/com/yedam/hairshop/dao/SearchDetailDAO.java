package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.SearchDetailVo;
import com.yedam.hairshop.model.SearchVo;

public class SearchDetailDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static SearchDetailDAO instance = null;
	public static SearchDetailDAO getInstance(){
		if(instance == null)
			instance = new SearchDetailDAO();
		return instance;
	}
	
	/*
	 * conn = ConnectionManager.getConnnect();
				String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE," + 
							" HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME," + 
							" HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC" + 
							" FROM HAIRSHOP" + 
							" WHERE HS_NO = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hsVo.getHs_no());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					
					
				} else {
					System.out.println("no data");
				}
	 * */
	
	public List<HairshopVo> selectListHairshop(SearchDetailVo vo) {
		List<HairshopVo> list = new ArrayList<HairshopVo>();
		try {
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE," + 
					" HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME," + 
					" HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC" + 
					" FROM HAIRSHOP" + 
					" WHERE HS_NAME LIKE '%'|| ? || '%' OR " + 
					"      HS_PROFILE LIKE '%' || ? || '%' OR " + 
					"      HS_FULLADDR LIKE '%' || ? || '%' ";
			
//			System.out.println(sql);
			
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getLabel());
			pstmt.setString(2, vo.getLabel());
			pstmt.setString(3, vo.getLabel());

			//vo.getTimeStart();
			//vo.getTimeEnd();
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//SearchDetailVo tmpVo = new SearchDetailVo();
				HairshopVo resultVo = new HairshopVo();
				resultVo.setHs_no(rs.getString("HS_NO"));
				resultVo.setHs_name(rs.getString("HS_NAME"));
				resultVo.setHs_owner(rs.getString("HS_OWNER"));
				resultVo.setHs_tel(rs.getString("HS_TEL"));
				resultVo.setHs_email(rs.getString("HS_EMAIL"));
				resultVo.setHs_pw(rs.getString("HS_PW"));
				resultVo.setHs_comp_no(rs.getString("HS_COMP_NO"));
				resultVo.setHs_profile(rs.getString("HS_PROFILE"));
				resultVo.setHs_notice(rs.getString("HS_NOTICE"));
				resultVo.setHs_fulladdr(rs.getString("HS_FULLADDR"));
				resultVo.setHs_cityaddr(rs.getString("HS_CITYADDR"));
				resultVo.setHs_townaddr(rs.getString("HS_TOWNADDR"));
				resultVo.setHs_streetaddr(rs.getString("HS_STREETADDR"));
				resultVo.setHs_latlong(rs.getString("HS_LATLONG"));
				resultVo.setHs_dayoff(rs.getString("HS_DAYOFF"));
				resultVo.setHs_starttime(rs.getString("HS_STARTTIME"));
				resultVo.setHs_endtime(rs.getString("HS_ENDTIME"));
				resultVo.setHs_resource_option(rs.getString("HS_RESOURCE_OPTION"));
				resultVo.setHs_parking(rs.getString("HS_PARKING"));
				resultVo.setHs_etc(rs.getString("HS_ETC"));
				list.add(resultVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}	
}
