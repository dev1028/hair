package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopNoticeVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.SearchDetailVo;

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

	public HairshopVo selectOne(HairshopVo hsVo) {
		HairshopVo resultVo = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,"
					+ " HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ " HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC" + " FROM HAIRSHOP" + " WHERE HS_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsVo.getHs_no());
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

	// 단건 조회
	public HairshopVo loginSelectOne(HairshopVo hsVo) {
		HairshopVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,"
					+ " HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ " HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC" + " FROM HAIRSHOP" + " WHERE HS_EMAIL = ?"
					+ " AND HS_PW =?";
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

	public List<HairshopVo> selectAll() {
		List<HairshopVo> list = new ArrayList<HairshopVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,"
					+ " HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ " HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC" + " FROM HAIRSHOP";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 2020.09.24 헤어샵 회원가입 insert
	public int insert(HairshopVo hVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into hairshop(HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,"
					+ "HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,HS_FULLADDR,HS_CITYADDR,"
					+ "HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ "HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC,HS_APPROVAL)"
					+ " values(hs_no_seq.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hVo.getHs_name());
			pstmt.setString(2, hVo.getHs_owner());
			pstmt.setString(3, hVo.getHs_tel());
			pstmt.setString(4, hVo.getHs_email());
			pstmt.setString(5, hVo.getHs_pw());
			pstmt.setString(6, hVo.getHs_comp_no());
			pstmt.setString(7, hVo.getHs_profile());
			pstmt.setString(8, hVo.getHs_notice());
			pstmt.setString(9, hVo.getHs_fulladdr());
			pstmt.setString(10, hVo.getHs_cityaddr());
			pstmt.setString(11, hVo.getHs_townaddr());
			pstmt.setString(12, hVo.getHs_streetaddr());
			pstmt.setString(13, hVo.getHs_latlong());
			pstmt.setString(14, hVo.getHs_dayoff());
			pstmt.setString(15, hVo.getHs_starttime());
			pstmt.setString(16, hVo.getHs_endtime());
			pstmt.setString(17, hVo.getHs_resource_option());
			pstmt.setString(18, hVo.getHs_parking());
			pstmt.setString(19, hVo.getHs_etc());
			pstmt.setString(20, hVo.getHs_approval());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	// 2020.09.24 김승연
	// email 사용여부조회
	public int selectCntEmail(String hs_email) {
		int count = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT COUNT(HS_EMAIL) FROM HAIRSHOP WHERE HS_EMAIL = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hs_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return count;
	}

	// 공지사항 list
	public List<HairshopNoticeVo> selectList() {
		List<HairshopNoticeVo> list = new ArrayList<HairshopNoticeVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NOTICE_NO , NOTICE_TITLE, NOTICE_CONTENTS ,NOTICE_WRITEDATE ,"
					+ "NOTICE_HITS , NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME" + " FROM NOTICE ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				HairshopNoticeVo resultVo = new HairshopNoticeVo();
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_contents(rs.getString("notice_contents"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setNotice_image(rs.getString("notice_image"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_categoryname(rs.getString("notice_categoryname"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	// 공지사항 작성
	//notice_no_seq 
	public int insert(HairshopNoticeVo noticeVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO NOTICE(NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
						+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME)"
						+ " VALUES(NOTICE_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_title());
			pstmt.setString(2, noticeVo.getNotice_contents());
			pstmt.setString(3, noticeVo.getNotice_writedate());
			pstmt.setString(4, noticeVo.getNotice_hits());
			pstmt.setString(5, noticeVo.getNotice_image());
			pstmt.setString(6, noticeVo.getEmp_no());
			pstmt.setString(7, noticeVo.getNotice_categoryname());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}
	
	//
	public List<HairshopVo> selectRankHairshop(){
		List<HairshopVo> list = new ArrayList<HairshopVo>();
		
		return list;
	}
	
	
	//랭킹 3위만 표시
	public List<HairshopVo> selectListHairshopRank(SearchDetailVo vo){
		List<HairshopVo> list = new ArrayList<HairshopVo>();
		String sql =" SELECT RN,HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE " +
					" HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME, " + 
					" HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC " + 
				    " FROM (SELECT rownum rn, k.* FROM " + 
					"  (SELECT r.cnt, h.* " + 
					"  FROM (SELECT hs_no, COUNT(*) AS cnt " + 
					"        FROM favor_hs " + 
					"        GROUP BY HS_NO) r " + 
					"  JOIN hairshop h " + 
					"  ON h.hs_no = r.hs_no " + 
					"  ORDER BY r.cnt DESC) k) " + 
					"WHERE rn <= 3";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HairshopVo resultVo = new HairshopVo();
				resultVo.setHs_rn(rs.getString("RN"));
				resultVo.setHs_no(rs.getString("HS_NO"));
				resultVo.setHs_name(rs.getString("HS_NAME"));
				resultVo.setHs_owner(rs.getString("HS_OWNER"));
				resultVo.setHs_tel(rs.getString("HS_TEL"));
				resultVo.setHs_email(rs.getString("HS_EMAIL"));
				resultVo.setHs_pw(rs.getString("HS_PW"));
				resultVo.setHs_comp_no(rs.getString("HS_COMP_NO"));
				resultVo.setHs_profile(rs.getString("HS_PROFILE"));
				
				//집에서 에러남 HS_NOTICE. developer 에서 select하면 잘됨.
//				resultVo.setHs_notice(rs.getString("HS_NOTICE"));
//				resultVo.setHs_fulladdr(rs.getString("HS_FULLADDR"));
//				resultVo.setHs_cityaddr(rs.getString("HS_CITYADDR"));
//				resultVo.setHs_townaddr(rs.getString("HS_TOWNADDR"));
//				resultVo.setHs_streetaddr(rs.getString("HS_STREETADDR"));
//				resultVo.setHs_latlong(rs.getString("HS_LATLONG"));
//				resultVo.setHs_dayoff(rs.getString("HS_DAYOFF"));
//				resultVo.setHs_starttime(rs.getString("HS_STARTTIME"));
//				resultVo.setHs_endtime(rs.getString("HS_ENDTIME"));
//				resultVo.setHs_resource_option(rs.getString("HS_RESOURCE_OPTION"));
//				resultVo.setHs_parking(rs.getString("HS_PARKING"));
//				resultVo.setHs_etc(rs.getString("HS_ETC"));
				list.add(resultVo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}