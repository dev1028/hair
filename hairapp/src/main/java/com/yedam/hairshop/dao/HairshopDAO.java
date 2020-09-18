package com.yedam.hairshop.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopVo;


public class HairshopDAO {
	
	// 전역변수
		static Connection conn;
		PreparedStatement pstmt;
		ResultSet rs = null;

		// 싱글톤
		static HairshopDAO instance;

		public static HairshopDAO getInstance() {
			if (instance == null)
				instance = new HairshopDAO();
			return instance;
		}
		
		// 단건 조회
		public HairshopVo loginSelectOne(HairshopVo hsVo) {
			HairshopVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE," + 
							" HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME," + 
							" HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC" + 
							" FROM HAIRSHOP" + 
							" WHERE HS_EMAIL = ?" + 
							" AND HS_PW =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hsVo.getHs_email());
				pstmt.setString(2, hsVo.getHs_pw());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					resultVo = new HairshopVo();
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
					
				} else {
					System.out.println("no data");
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.close(rs, pstmt, conn);
			}
			return resultVo;
		}

	

}
