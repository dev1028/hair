package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersEventVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHairshopDAO {

	// 전역변수
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static MembersHairshopDAO instance;

	public static MembersHairshopDAO getInstance() {
		if (instance == null)
			instance = new MembersHairshopDAO();
		return instance;
	}

	// 헤어샵 정보 보여주기
	public MembersHairshopVo selectOne(HairshopVo hairshopVo) {
		ResultSet rs = null;
		MembersHairshopVo members = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_tel, h.hs_fulladdr, h.hs_starttime, h.hs_endtime, h.hs_dayoff,"
					+ " count(d.designer_access_status), h.hs_parking, h.hs_etc, h.hs_name, h.hs_latlong, h.hs_notice"
					+ " from hairshop h left outer join designer d" + " on (h.hs_no=d.hs_no)"
					+ " where h.hs_no = ?"
					+ " group by h.hs_tel, h.hs_fulladdr, h.hs_starttime, h.hs_endtime,"
					+ 			" h.hs_dayoff, h.hs_parking, h.hs_etc, h.hs_name, h.hs_latlong, h.hs_notice";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("헤어샵정보: "+ sql);

			if(rs.next()) {
				members = new MembersHairshopVo();
				members.setHs_tel(rs.getString(1));
				members.setHs_fulladdr(rs.getString(2));
				members.setHs_starttime(rs.getString(3));
				members.setHs_endtime(rs.getString(4));
				members.setHs_dayoff(rs.getString(5));
				members.setDesigner_access_status(rs.getString(6));
				members.setHs_parking(rs.getString(7));
				members.setHs_etc(rs.getString(8));
				members.setHs_name(rs.getString(9));
				members.setHs_latlong(rs.getString(10));
				members.setHs_notice(rs.getString(11));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return members; // 값을 리턴해줌
	}

	// 디자이너 정보 보여주기
	public List<MembersHairshopVo> designerIntroAll(HairshopVo hairshopVo) {
		ResultSet rs = null;
		List<MembersHairshopVo> list = new ArrayList<MembersHairshopVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select designer_name, position, designer_profile, hs_no, file_name" + 
					" from designer" + 
					" where designer_access_status = 1" + 
					" and hs_no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("디자이너정보: "+sql);

			while (rs.next()) {
				MembersHairshopVo members = new MembersHairshopVo();
				members.setDesigner_name(rs.getString(1));
				members.setPosition(rs.getString(2));
				members.setDesigner_profile(rs.getString(3));
				members.setHs_no(rs.getString(4));
				members.setFile_name(rs.getString(5));
				list.add(members); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}
	
	// 쿠폰리스트 뿌리기
	public ArrayList<MembersEventVo> couponList(MembersEventVo eventVo) {
		ResultSet rs = null;
		MembersEventVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<MembersEventVo> list = new ArrayList<MembersEventVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT HSC_NO, HS_NO, HSC_ISSUEDATE, HSC_EXPIREDATE, HSC_COUPON_QUANTITY," 
					+ " HSC_DISCOUNT_RATE, HSC_MAXDISCOUNT_PAY, HSC_NAME" 
					+ " FROM HS_COUPON WHERE HS_NO = ? AND HSC_COUPON_QUANTITY >= 0"
					+ " ORDER BY HSC_NO DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventVo.getHs_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new MembersEventVo();
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setHs_no(rs.getString("hs_no"));
				resultVo.setHsc_issuedate(rs.getString("hsc_issuedate"));
				resultVo.setHsc_expiredate(rs.getString("hsc_expiredate"));
				resultVo.setHsc_coupon_quantity(rs.getString("hsc_coupon_quantity"));
				resultVo.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("hsc_maxdiscount_pay"));
				resultVo.setHsc_name(rs.getString("hsc_name"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	} // end
	
	
	// 쿠폰 받기
	public MembersEventVo couponIssuance(MembersEventVo eventVo) {
		int r = 1;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "INSERT INTO MEMBERS_COUPON(MC_NO, HSC_NO, MEM_NO, MC_ISSUEDATE, MC_EXPIREDATE, MC_USED) "
					+ " VALUES(mc_no_seq.nextval,?,?,sysdate,sysdate+10,0)";

			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, eventVo.getHsc_no());
			psmt.setString(2, eventVo.getMem_no());

			psmt.executeUpdate();

			// 3. 결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return eventVo;
	} // end
	
	
	// numOfCoupenUp
	public MembersEventVo numOfCoupenUp(MembersEventVo eventVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE HS_COUPON "
					+ " SET HSC_COUPON_QUANTITY = HSC_COUPON_QUANTITY-1"
					+ " WHERE HSC_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventVo.getHsc_no());

			int r = pstmt.executeUpdate(); // 실행
			System.out.println(r + " 건이 수정됨"); // 결과 처리

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
		return eventVo;
	} // end numOfCoupenUp()
	
	
	// 세션에 평균별이랑 리뷰수 보내는거
	public HairShopReviewVo reviewCount(HairshopVo hairshopVo) {
		ResultSet rs = null;
		HairShopReviewVo resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "select count(hs_no) as hs_no, avg(hr_rate) as hr_rate" 
					+ " from hairshop_reviews" 
					+ " where hs_no=?"
					+ " group by hs_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new HairShopReviewVo();
				resultVO.setHs_no(rs.getString("hs_no"));
				resultVO.setHr_rate(rs.getString("hr_rate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO; // 값을 리턴해줌
	}
	
	// 세션에 평균별이랑 리뷰수 보내는거
	public HairshopBookmarkVo bookmarkCount(HairshopVo hairshopVo) {
		ResultSet rs = null;
		HairshopBookmarkVo resultVO = null;
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "select count(hs_no) as hs_no from favor_hs where hs_no=? group by hs_no";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new HairshopBookmarkVo();
				resultVO.setHs_no(rs.getString("hs_no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO; // 값을 리턴해줌
	}

}
