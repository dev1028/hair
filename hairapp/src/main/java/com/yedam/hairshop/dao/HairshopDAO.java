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
import com.yedam.hairshop.model.SearchRankVo;

public class HairshopDAO {
	// 전역변수
	static Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static HairshopDAO instance;

	public static HairshopDAO getInstance() {
//		if (instance == null)
//			instance = new HairshopDAO();
		return new HairshopDAO();// instance;
	}

	public HairshopVo selectOne(HairshopVo hsVo) {
		HairshopVo resultVo = null;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,"
					+ " HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ " HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC,HS_REGDATE, HS_APPROVAL" + " FROM HAIRSHOP"
					+ " WHERE HS_NO = ?";
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
				resultVo.setHs_regdate(rs.getString("HS_REGDATE"));
				resultVo.setHs_approval(rs.getString("HS_APPROVAL"));

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
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,"
					+ " HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ " HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC, HS_REGDATE, HS_APPROVAL" + " FROM HAIRSHOP"
					+ " WHERE HS_EMAIL = ?" + " AND HS_PW =?";
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
				resultVo.setHs_regdate(rs.getString("HS_REGDATE"));
				resultVo.setHs_approval(rs.getString("HS_APPROVAL"));
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
		ResultSet rs = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,"
					+ " HS_FULLADDR,HS_CITYADDR, HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ " HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC,HS_REGDATE,HS_APPROVAL" + " FROM HAIRSHOP";
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

				resultVo.setHs_approval(rs.getString("HS_APPROVAL"));
				resultVo.setHs_regdate(rs.getString("HS_REGDATE"));
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
		ResultSet rs = null;

		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into hairshop(HS_NO,HS_NAME,HS_OWNER,HS_TEL,HS_EMAIL,"
					+ "HS_PW,HS_COMP_NO,HS_PROFILE,HS_NOTICE,HS_FULLADDR,HS_CITYADDR,"
					+ "HS_TOWNADDR,HS_STREETADDR,HS_LATLONG,HS_DAYOFF,HS_STARTTIME,"
					+ "HS_ENDTIME,HS_RESOURCE_OPTION,HS_PARKING,HS_ETC,HS_APPROVAL,HS_REGDATE)"
					+ " values(hs_no_seq.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
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
			pstmt.setInt(20, Integer.parseInt(hVo.getHs_approval()));
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	// 2020.09.24 김승연
	// email 사용여부조회
	public int selectCntEmail(String hs_email) {
		ResultSet rs = null;

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

	// 랭킹 10위 까지만 표시
	public List<HairshopVo> selectListHairshopRank(SearchRankVo vo) {
		ResultSet rs = null;
		List<HairshopVo> list = new ArrayList<HairshopVo>();
		String sql = "SELECT RN, DISTANCE, HS_NO, HS_NAME, HS_OWNER,  "
				+ "       HS_TEL, HS_EMAIL, HS_PW, HS_COMP_NO,  "
				+ "       HS_PROFILE, HS_NOTICE, HS_FULLADDR, HS_CITYADDR, "
				+ "       HS_TOWNADDR, HS_STREETADDR, HS_LATLONG, HS_DAYOFF, HS_STARTTIME,  "
				+ "       HS_ENDTIME, HS_RESOURCE_OPTION, HS_PARKING, HS_ETC, NVL2((SELECT mem_no "
				+ "															      FROM favor_hs "
				+ "															      WHERE hs.hs_no = hs_no AND mem_no = ?), 1, 0) as HS_BOOK "
				+ "FROM (SELECT rownum rn, k.* " + "      FROM (SELECT r.cnt,  " + "                   h.*,  "
				+ "                   TRUNC(getDistance(?, ?, substr(HS_LATLONG, 0, instr(HS_LATLONG, ',')-1), substr(HS_LATLONG, instr(HS_LATLONG, ',')+1)), 2) as distance "
				+ "            FROM (SELECT hs_no, COUNT(*) AS cnt " + "                  FROM favor_hs  "
				+ "                  GROUP BY HS_NO) r " + "            JOIN hairshop h "
				+ "            ON h.hs_no = r.hs_no " + "            ORDER BY r.cnt DESC) k) hs "
				+ "       WHERE rn <= 10 AND distance < 1000";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_no());
			pstmt.setString(2, vo.getLat());
			pstmt.setString(3, vo.getLng());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopVo resultVo = new HairshopVo();
				resultVo.setHs_rn(rs.getString("RN"));
				resultVo.setDistance(rs.getString("DISTANCE"));
				resultVo.setHs_no(rs.getString("HS_NO"));
				resultVo.setHs_name(rs.getString("HS_NAME"));
				resultVo.setHs_owner(rs.getString("HS_OWNER"));
				resultVo.setHs_tel(rs.getString("HS_TEL"));
				resultVo.setHs_email(rs.getString("HS_EMAIL"));
				resultVo.setHs_pw(rs.getString("HS_PW"));
				resultVo.setHs_comp_no(rs.getString("HS_COMP_NO"));
				resultVo.setHs_profile(rs.getString("HS_PROFILE"));

				// 집에서 에러남 HS_NOTICE. developer 에서 select하면 잘됨.
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
				resultVo.setHs_book(rs.getString("HS_BOOK"));
				list.add(resultVo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

	// 2020.10.11 김승연
	// 공지사항 프로필 업데이트
	public int updateNoticeAndProfile(HairshopVo hVo) {
		ResultSet rs = null;

		int result = 0;
		String sql = "UPDATE HAIRSHOP SET HS_NOTICE = ?, HS_PROFILE = ? WHERE HS_NO = ?";

		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hVo.getHs_notice());
			pstmt.setString(2, hVo.getHs_profile());
			pstmt.setString(3, hVo.getHs_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}

	// 2020.10.11 김승연
	// 주차장 여부 업데이트
	public int updateHsParking(HairshopVo hVo) {
		ResultSet rs = null;

		int result = 0;
		String sql = "UPDATE HAIRSHOP SET HS_PARKING = ? WHERE HS_NO = ?";

		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hVo.getHs_parking());
			pstmt.setString(2, hVo.getHs_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}

	// 2020.10.12 김승연
	// 헤어샵 마이페이지에서 정보수정
	public int updateHairshop(HairshopVo hVo) {
		ResultSet rs = null;
		int result = 0;
		String sql = "UPDATE HAIRSHOP SET HS_TEL = ?, HS_FULLADDR = ? , HS_CITYADDR = ?, HS_TOWNADDR = ?, HS_STREETADDR = ?, HS_LATLONG = ?,"
				+ " HS_STARTTIME = ?, HS_ENDTIME = ? WHERE HS_NO = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hVo.getHs_tel());
			pstmt.setString(2, hVo.getHs_fulladdr());
			pstmt.setString(3, hVo.getHs_cityaddr());
			pstmt.setString(4, hVo.getHs_townaddr());
			pstmt.setString(5, hVo.getHs_streetaddr());
			pstmt.setString(6, hVo.getHs_latlong());
			pstmt.setString(7, hVo.getHs_starttime());
			pstmt.setString(8, hVo.getHs_endtime());
			pstmt.setString(9, hVo.getHs_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	}

	public int updateForAuth(String hsEmail) {
		ResultSet rs = null; // 초기화
		int r = 0;
		String sql = "UPDATE hairshop SET HS_APPROVAL = 0 WHERE hs_email = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsEmail);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	
	
	// 공지사항 view
	public HairshopNoticeVo noticeView(HairshopNoticeVo noticeVo) {
		HairshopNoticeVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ResultSet rs = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME" + " FROM NOTICE "
					+ " WHERE NOTICE_WHO = 'j1'" + " AND NOTICE_NO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new HairshopNoticeVo();
				resultVo.setNotice_no(rs.getString("notice_no"));
				resultVo.setNotice_title(rs.getString("notice_title"));
				resultVo.setNotice_contents(rs.getString("notice_contents"));
				resultVo.setNotice_writedate(rs.getString("notice_writedate"));
				resultVo.setNotice_hits(rs.getString("notice_hits"));
				resultVo.setNotice_image(rs.getString("notice_image"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setNotice_categoryname(rs.getString("notice_categoryname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;

	}

	// 조회수
	public int upHit(HairshopNoticeVo noticeVo) {
		int result = 0;
		ResultSet rs = null;

		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn
					.prepareStatement("UPDATE NOTICE" + " SET NOTICE_HITS = NOTICE_HITS + 1" + " WHERE NOTICE_NO = ?");
			pstmt.setString(1, noticeVo.getNotice_no());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return result;
	}

	// 공지사항 작성
	public int insert(HairshopNoticeVo noticeVo) {
		ResultSet rs = null;
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO NOTICE(NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME, NOTICE_WHO)"
					+ " VALUES(NOTICE_NO_SEQ.NEXTVAL, ?, ?, sysdate, 0, ?, 50, ?,'j1')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_title());
			pstmt.setString(2, noticeVo.getNotice_contents());
			pstmt.setString(3, noticeVo.getNotice_image());
			pstmt.setString(4, noticeVo.getNotice_categoryname());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	// 공지사항 전체 조회(페이징)
	public ArrayList<HairshopNoticeVo> selectPaging(HairshopNoticeVo noticeVo) { // 조회가 여러건이면 DeptVO를 list에 담음
		ResultSet rs = null;
		HairshopNoticeVo resultVO = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<HairshopNoticeVo> list = new ArrayList<HairshopNoticeVo>(); // 결과값을 저장할 list 변수 객체 선언
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "select a.* from (select rownum rn,b.* from ("
					+ " SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENTS, NOTICE_WRITEDATE,"
					+ " NOTICE_HITS, NOTICE_IMAGE, EMP_NO, NOTICE_CATEGORYNAME" + " FROM NOTICE"
					+ " where notice_who = 'j1'" + " ORDER BY NOTICE_WRITEDATE desc"
					+ " ) b) a where rn between ? and ?";
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			int pos = 1; // 물음표값 동적으로 하려고 변수선언

			pstmt.setInt(pos++, noticeVo.getFirst()); // 물음표부분이 pos++로 인해 동적으로 늘어남
			pstmt.setInt(pos++, noticeVo.getLast());
			rs = pstmt.executeQuery(); // select 시에는 executeQuery() 쓰기

			while (rs.next()) { // 여러건 조회라서 while를 사용. next()로 한건 한건마다 true 인지 false인지 확인하고 이동함
				resultVO = new HairshopNoticeVo(); // 레코드 한건을 resultVO에 담음
				resultVO.setNotice_no(rs.getString("notice_no"));
				resultVO.setNotice_title(rs.getString("notice_title"));
				resultVO.setNotice_contents(rs.getString("notice_contents"));
				resultVO.setNotice_writedate(rs.getString("notice_writedate"));
				resultVO.setNotice_hits(rs.getString("notice_hits"));
				resultVO.setNotice_image(rs.getString("notice_image"));
				resultVO.setEmp_no(rs.getString("emp_no"));
				resultVO.setNotice_categoryname(rs.getString("notice_categoryname"));
				list.add(resultVO); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// 전체 건수
	public int count(HairshopNoticeVo noticeVo) {
		ResultSet rs = null;
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "SELECT COUNT(*) FROM NOTICE" + " WHERE NOTICE_WHO = 'j1' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}

	// 공지 수정
	public void noticeModify(HairshopNoticeVo noticeVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE NOTICE"
					+ " SET NOTICE_TITLE =?, NOTICE_CONTENTS=?, NOTICE_IMAGE=?, NOTICE_CATEGORYNAME=?"
					+ " WHERE NOTICE_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noticeVo.getNotice_title());
			pstmt.setString(2, noticeVo.getNotice_contents());
			pstmt.setString(3, noticeVo.getNotice_image());
			pstmt.setString(4, noticeVo.getNotice_categoryname());
			pstmt.setString(5, noticeVo.getNotice_no());

			pstmt.executeUpdate(); // 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	} // end 공지수정

	// 공지삭제
	public void noticeDelete(HairshopNoticeVo noticeVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM NOTICE WHERE NOTICE_NO=?"; // 값 들어갈 자리에 ? 로 지정
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			pstmt.setString(1, noticeVo.getNotice_no()); // ?의 첫번째 자리에 올 값 지정
			int r = pstmt.executeUpdate(); // 실행
			System.out.println(r + " 건이 삭제됨"); // 결과 처리

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	} // 공지삭제 끝

	// Qna 메인에 띄울거
	public ArrayList<HairshopNoticeVo> mainNoticeList() {
		ResultSet rs = null;
		HairshopNoticeVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<HairshopNoticeVo> list = new ArrayList<HairshopNoticeVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT NOTICE_TITLE FROM NOTICE" + " WHERE ROWNUM <=3 AND NOTICE_WHO = 'j1'"
					+ " ORDER BY NOTICE_NO DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new HairshopNoticeVo();
				resultVo.setNotice_title(rs.getString("notice_title"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	} // end
}