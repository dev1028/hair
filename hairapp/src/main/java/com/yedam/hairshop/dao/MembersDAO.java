package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.MembersVo;

public class MembersDAO {

	// 전역변수
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static MembersDAO instance;

	public static MembersDAO getInstance() {
		if (instance == null)
			instance = new MembersDAO();
		return instance;
	}

	// 로그인 단건 조회
	public MembersVo loginSelectOne(MembersVo membersVO) {
		ResultSet rs = null;
		MembersVo members = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from members " + " where mem_email=? and mem_pw=?";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVO.getMem_email());
			pstmt.setString(2, membersVO.getMem_pw());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				members = new MembersVo();
				members.setMem_no(rs.getString(1));
				members.setMem_email(rs.getString(2));
				members.setMem_pw(rs.getString(3));
				members.setMem_name(rs.getString(4));
				members.setMem_phone(rs.getString(5));
				members.setMem_birth(rs.getString(6));
				members.setMem_sex(rs.getString(7));
				members.setMem_addr(rs.getString(8));
				members.setMem_city(rs.getString(9));
				members.setMem_country(rs.getString(10));
				members.setMem_township(rs.getString(11));
				members.setMem_latitude_longitude(rs.getString(12));
				members.setMem_saved_money(rs.getString(13));
				members.setMem_city_latitude_longitude(rs.getString(14));
				members.setMem_hair_length(rs.getString(15));
				members.setMem_hair_status(rs.getString(16));
				members.setMem_zip(rs.getString(17));
				members.setMem_access_status(rs.getString(18));
			} else {
				System.out.println("no data");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return members; // 값을 리턴해줌
	}

	// 단건 조회
	public MembersVo selectOne(MembersVo membersVO) {
		ResultSet rs = null;
		MembersVo members = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from members " + " where mem_no=?";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVO.getMem_no());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				members = new MembersVo();
				members.setMem_no(rs.getString(1));
				members.setMem_email(rs.getString(2));
				members.setMem_pw(rs.getString(3));
				members.setMem_name(rs.getString(4));
				members.setMem_phone(rs.getString(5));
				members.setMem_birth(rs.getString(6));
				members.setMem_sex(rs.getString(7));
				members.setMem_addr(rs.getString(8));
				members.setMem_city(rs.getString(9));
				members.setMem_country(rs.getString(10));
				members.setMem_township(rs.getString(11));
				members.setMem_latitude_longitude(rs.getString(12));
				members.setMem_saved_money(rs.getString(13));
				members.setMem_city_latitude_longitude(rs.getString(14));
				members.setMem_hair_length(rs.getString(15));
				members.setMem_hair_status(rs.getString(16));
				members.setMem_zip(rs.getString(17));
				members.setMem_access_status(rs.getString(18));
			} else {
				System.out.println("no data");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return members; // 값을 리턴해줌
	}

	// 회원정보 불러오기
	public MembersVo getMembersInfo(String mem_email) {
		ResultSet rs = null;
		MembersVo members = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT MEM_NO,MEM_EMAIL,MEM_PW,MEM_NAME,MEM_PHONE, MEM_BIRTH, MEM_SEX,"
					+ " MEM_ADDR, MEM_CITY, MEM_COUNTRY, MEM_TOWNSHIP, MEM_LATITUDE_LONGITUDE,"
					+ " MEM_SAVED_MONEY, MEM_CITY_LATITUDE_LONGITUDE, MEM_HAIR_LENGTH,"
					+ " MEM_HAIR_STATUS, MEM_ZIP, MEM_ACCESS_STATUS" + " FROM MEMBERS WHERE MEM_EMAIL=?";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				members = new MembersVo();
				members.setMem_no(rs.getString(1));
				members.setMem_email(rs.getString(2));
				members.setMem_pw(rs.getString(3));
				members.setMem_name(rs.getString(4));
				members.setMem_phone(rs.getString(5));
				members.setMem_birth(rs.getString(6));
				members.setMem_sex(rs.getString(7));
				members.setMem_addr(rs.getString(8));
				members.setMem_city(rs.getString(9));
				members.setMem_country(rs.getString(10));
				members.setMem_township(rs.getString(11));
				members.setMem_latitude_longitude(rs.getString(12));
				members.setMem_saved_money(rs.getString(13));
				members.setMem_city_latitude_longitude(rs.getString(14));
				members.setMem_hair_length(rs.getString(15));
				members.setMem_hair_status(rs.getString(16));
				members.setMem_zip(rs.getString(17));
				members.setMem_access_status(rs.getString(18));
			} else {
				System.out.println("no data");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return members; // 값을 리턴해줌
	} // end getMembersInfo()

	// 전체 조회
	public List<MembersVo> selectAll() { // 조회가 여러건이면 DeptVO를 list에 담음
		ResultSet rs = null;
		List<MembersVo> list = new ArrayList<MembersVo>(); // 결과값을 저장할 list 변수 객체 선언

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select * from members" + " ORDER BY mem_no";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MembersVo members = new MembersVo();
				members.setMem_no(rs.getString(1));
				members.setMem_email(rs.getString(2));
				members.setMem_pw(rs.getString(3));
				members.setMem_name(rs.getString(4));
				members.setMem_phone(rs.getString(5));
				members.setMem_birth(rs.getString(6));
				members.setMem_sex(rs.getString(7));
				members.setMem_addr(rs.getString(8));
				members.setMem_city(rs.getString(9));
				members.setMem_country(rs.getString(10));
				members.setMem_township(rs.getString(11));
				members.setMem_latitude_longitude(rs.getString(12));
				members.setMem_saved_money(rs.getString(13));
				members.setMem_city_latitude_longitude(rs.getString(14));
				members.setMem_hair_length(rs.getString(15));
				members.setMem_hair_status(rs.getString(16));
				members.setMem_zip(rs.getString(17));
				members.setMem_access_status(rs.getString(18));
				list.add(members); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// membersModify
	public void membersModify(MembersVo membersVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update members "
					+ " set MEM_PW =?, MEM_NAME=?, MEM_PHONE=?, MEM_BIRTH=?, MEM_SEX=?, MEM_ADDR=?, "
					+ " MEM_CITY=?, MEM_COUNTRY=?, MEM_TOWNSHIP=?, MEM_ZIP=?, MEM_HAIR_LENGTH=?, MEM_HAIR_STATUS=? "
					+ " where MEM_EMAIL=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVo.getMem_pw());
			pstmt.setString(2, membersVo.getMem_name());
			pstmt.setString(3, membersVo.getMem_phone());
			pstmt.setString(4, membersVo.getMem_birth());
			pstmt.setString(5, membersVo.getMem_sex());
			pstmt.setString(6, membersVo.getMem_addr());
			pstmt.setString(7, membersVo.getMem_city());
			pstmt.setString(8, membersVo.getMem_country());
			pstmt.setString(9, membersVo.getMem_township());
			pstmt.setString(10, membersVo.getMem_zip());
			pstmt.setString(11, membersVo.getMem_hair_length());
			pstmt.setString(12, membersVo.getMem_hair_status());
			pstmt.setString(13, membersVo.getMem_email());

			int r = pstmt.executeUpdate(); // 실행
			System.out.println(r + " 건이 수정됨"); // 결과 처리

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	} // end membersModify()

	// delete
	public void delete(MembersVo membersVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "delete from members where mem_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVO.getMem_email());
			int r = pstmt.executeUpdate();
			System.out.println(r + " 건이 삭제됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	}

	// membersJoinInsert
	public MembersVo membersJoin(MembersVo membersVo) {
		int r = 1;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into members(MEM_NO, MEM_EMAIL, MEM_PW, MEM_NAME, MEM_PHONE, MEM_BIRTH,"
					+ " MEM_SEX, MEM_ADDR, MEM_CITY, MEM_COUNTRY, MEM_TOWNSHIP, MEM_ZIP, MEM_HAIR_LENGTH,"
					+ " MEM_HAIR_STATUS, MEM_ACCESS_STATUS) "
					+ " values(members_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,-1)";

			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, membersVo.getMem_email());
			psmt.setString(2, membersVo.getMem_pw());
			psmt.setString(3, membersVo.getMem_name());
			psmt.setString(4, membersVo.getMem_phone());
			psmt.setString(5, membersVo.getMem_birth());
			psmt.setString(6, membersVo.getMem_sex());
			psmt.setString(7, membersVo.getMem_addr());
			psmt.setString(8, membersVo.getMem_city());
			psmt.setString(9, membersVo.getMem_country());
			psmt.setString(10, membersVo.getMem_township());
			psmt.setString(11, membersVo.getMem_zip());
			psmt.setString(12, membersVo.getMem_hair_length());
			psmt.setString(13, membersVo.getMem_hair_status());

			psmt.executeUpdate();

			// 3. 결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return membersVo;
	}

	// 이메일 할라고 만듬 membersJoinEmail(회원가입할때 이 DAO로 사용)
	public int membersJoinEmail(MembersVo membersVo) {
		int r = 1;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into members(MEM_NO, MEM_EMAIL, MEM_PW, MEM_NAME, MEM_PHONE, MEM_BIRTH,"
					+ " MEM_SEX, MEM_ADDR, MEM_CITY, MEM_COUNTRY, MEM_TOWNSHIP, MEM_ZIP, MEM_HAIR_LENGTH,"
					+ " MEM_HAIR_STATUS, MEM_ACCESS_STATUS) "
					+ " values(members_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,-1)";

			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, membersVo.getMem_email());
			psmt.setString(2, membersVo.getMem_pw());
			psmt.setString(3, membersVo.getMem_name());
			psmt.setString(4, membersVo.getMem_phone());
			psmt.setString(5, membersVo.getMem_birth());
			psmt.setString(6, membersVo.getMem_sex());
			psmt.setString(7, membersVo.getMem_addr());
			psmt.setString(8, membersVo.getMem_city());
			psmt.setString(9, membersVo.getMem_country());
			psmt.setString(10, membersVo.getMem_township());
			psmt.setString(11, membersVo.getMem_zip());
			psmt.setString(12, membersVo.getMem_hair_length());
			psmt.setString(13, membersVo.getMem_hair_status());

			psmt.executeUpdate();

			// 3. 결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}
		return r;
	}

	// 회원가입 인증 정보 반영
	public int updateForAuth(String mem_email) {
		int r = 0;
		// 회원가입 인증 완료 1, 회원가입 인증 중 0, 회원가입 인증 전 -1
		String sql = "UPDATE MEMBERS SET MEM_ACCESS_STATUS = 1 WHERE MEM_EMAIL = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_email);
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	public int updateLatlng(MembersVo vo) {
		int r = 0;
		String sql = "UPDATE MEMBERS SET MEM_LATITUDE_LONGITUDE = ?, MEM_ADDR = ?, MEM_CITY = ? WHERE MEM_EMAIL = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMem_latitude_longitude());
			pstmt.setString(2, vo.getMem_addr());
			pstmt.setString(3, vo.getMem_addr());
			pstmt.setString(4, vo.getMem_email());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	/**
	 * 아이디 중복체크를 한다.
	 * 
	 * @param id 아이디
	 * @return x : 아이디 중복여부 확인값
	 */
	public boolean duplicateIdCheck(String id) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean x = false;

		try {
			// 쿼리
			StringBuffer query = new StringBuffer();
			query.append("SELECT MEM_EMAIL FROM MEMBERS WHERE MEM_EMAIL=?");

			conn = ConnectionManager.getConnnect();
			pstm = conn.prepareStatement(query.toString());
			pstm.setString(1, id);
			rs = pstm.executeQuery();

			if (rs.next())
				x = true; // 해당 아이디 존재

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
					pstm = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end duplicateIdCheck()

	// ID 찾기
	public MembersVo findId(MembersVo membersVo) {
		ResultSet rs = null;
		MembersVo members = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT MEM_EMAIL FROM MEMBERS WHERE MEM_NAME = ? AND MEM_PHONE = ? AND MEM_BIRTH = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVo.getMem_name());
			pstmt.setString(2, membersVo.getMem_phone());
			pstmt.setString(3, membersVo.getMem_birth());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				members = new MembersVo();
				members.setMem_email(rs.getString(1));

			} else {
				System.out.println("no data");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		System.out.println("members는 뭐불로오노:" + members.getMem_email());
		return members; // 값을 리턴해줌
	} // id찾기 끝

	// PW 찾기
	public MembersVo findPw(MembersVo membersVo) {
		ResultSet rs = null;
		MembersVo members = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT MEM_EMAIL FROM MEMBERS WHERE MEM_EMAIL = ? AND MEM_NAME = ? AND MEM_PHONE = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVo.getMem_email());
			pstmt.setString(2, membersVo.getMem_name());
			pstmt.setString(3, membersVo.getMem_phone());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				members = new MembersVo();
				members.setMem_email(rs.getString(1));

			} else {
				System.out.println("no data");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return members; // 값을 리턴해줌
	} // PW찾기 끝

	// 이메일로 인증받아서 pw 변경하기
	public void updateForPw(MembersVo membersVo) {
		String sql = "UPDATE MEMBERS SET MEM_PW = ? WHERE MEM_EMAIL = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVo.getMem_pw());
			pstmt.setString(2, membersVo.getMem_email());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원인증 9로 만들어서 회원탈퇴(10년간 정보 보관)
	public MembersVo membersDelete(MembersVo membersVo) {
		// 회원가입 인증 완료 1, 회원가입 인증 중 0, 회원가입 인증 전 -1, 회원탈퇴 9
		String sql = "UPDATE MEMBERS SET MEM_ACCESS_STATUS = 9 WHERE MEM_EMAIL = ? AND MEM_PW = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVo.getMem_email());
			pstmt.setString(2, membersVo.getMem_pw());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return membersVo;
	}

	/**
	 * 회원정보를 삭제한다.
	 * 
	 * @param id 회원정보 삭제 시 필요한 아이디
	 * @param pw 회원정보 삭제 시 필요한 비밀번호
	 * @return x : deleteMember() 수행 후 결과값
	 *//*
		 * public int deleteMember(String id, String pw) { String dbpw = ""; // DB상의
		 * 비밀번호를 담아둘 변수 int x = -1;
		 * 
		 * try { // 비밀번호 조회 StringBuffer query1 = new StringBuffer();
		 * query1.append("SELECT PASSWORD FROM JSP_MEMBER WHERE ID=?");
		 * 
		 * // 회원 삭제 StringBuffer query2 = new StringBuffer();
		 * query2.append("DELETE FROM JSP_MEMBER WHERE ID=?");
		 * 
		 * conn = ConnectionManager.getConnnect();
		 * 
		 * // 자동 커밋을 false로 한다. conn.setAutoCommit(false);
		 * 
		 * // 1. 아이디에 해당하는 비밀번호를 조회한다. pstmt = conn.prepareStatement(query1.toString());
		 * pstmt.setString(1, id); rs = pstmt.executeQuery();
		 * 
		 * if (rs.next()) { dbpw = rs.getString("password"); if (dbpw.equals(pw)) { //
		 * 입력된 비밀번호와 DB비번 비교 // 같을경우 회원삭제 진행 pstmt =
		 * conn.prepareStatement(query2.toString()); pstmt.setString(1, id);
		 * pstmt.executeUpdate(); conn.commit(); x = 1; // 삭제 성공 } else { x = 0; // 비밀번호
		 * 비교결과 - 다름 } }
		 * 
		 * return x;
		 * 
		 * } catch (Exception sqle) { try { conn.rollback(); // 오류시 롤백 } catch
		 * (SQLException e) { e.printStackTrace(); } throw new
		 * RuntimeException(sqle.getMessage()); } finally { try{ if ( pstmt != null ){
		 * pstmt.close(); pstmt=null; } if ( conn != null ){ conn.close(); conn=null; }
		 * } catch(Exception e){ throw new RuntimeException(e.getMessage()); } } } //
		 * end deleteMember
		 */

}
