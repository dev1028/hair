package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.MembersVo;

public class MembersDAO {

	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static MembersDAO instance;

	public static MembersDAO getInstance() {
		if (instance == null)
			instance = new MembersDAO();
		return instance;
	}

	// 단건 조회
	public MembersVo loginSelectOne(MembersVo membersVO) {
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

	// 전체 조회
	public List<MembersVo> selectAll() { // 조회가 여러건이면 DeptVO를 list에 담음
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
				list.add(members); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// login update
	public void update(MembersVo membersVO) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "update members set mem_pw =? where mem_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersVO.getMem_pw());
			pstmt.setString(2, membersVO.getMem_email());
			int r = pstmt.executeUpdate(); // 실행
			System.out.println(r + " 건이 수정됨"); // 결과 처리

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	}

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

	// insert
	public void insert(MembersVo membersVO) {
		int r = 0;
		try {
			// 1. DB 연결
			Connection conn = ConnectionManager.getConnnect(); // ConnectionManager클래스의 getConnnect실행

			// 2. sql 구문 실행
			String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, membersVO.getMem_no());
			psmt.setString(2, membersVO.getMem_email());
			psmt.setString(3, membersVO.getMem_pw());
			psmt.setString(4, membersVO.getMem_name());
			psmt.setString(5, membersVO.getMem_phone());
			psmt.setString(6, membersVO.getMem_birth());
			psmt.setString(7, membersVO.getMem_sex());
			psmt.setString(8, membersVO.getMem_addr());
			psmt.setString(9, membersVO.getMem_city());
			psmt.setString(10, membersVO.getMem_country());
			psmt.setString(11, membersVO.getMem_township());
			psmt.setString(12, membersVO.getMem_latitude_longitude());
			psmt.setString(13, membersVO.getMem_saved_money());
			psmt.setString(14, membersVO.getMem_city_latitude_longitude());
			psmt.setString(15, membersVO.getMem_hair_length());
			psmt.setString(16, membersVO.getMem_hair_status());

			psmt.executeUpdate();

			// 3. 결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			// 4. 연결 해제
			ConnectionManager.close(conn);
		}

	}

}
