package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HsGusetVo;

public class GuestDAO {

	// 전역변수, 모든 메서드에서 공통으로 사용되는 변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null; // 초기화

	// 싱글톤
	static GuestDAO instance;

	public static GuestDAO getInstance() {
		if (instance == null)
			instance = new GuestDAO();
		return instance;
	}

	// 단건 조회
	public HsGusetVo selectOne(HsGusetVo guestVo) {
		HsGusetVo resultVO = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT * FROM HS_GUEST WHERE HG_NO= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestVo.getHg_no());
			rs = pstmt.executeQuery();
			if (rs.next()) { // 처음 커서 위치는 BOF
				resultVO = new HsGusetVo();
				resultVO.setHg_no(rs.getString("hg_no"));
				resultVO.setHg_name(rs.getString("Hg_name"));
				resultVO.setHg_phone(rs.getString("Hg_phone"));
				resultVO.setHg_sex(rs.getString("Hg_sex"));
				resultVO.setHg_birth(rs.getString("Hg_birth"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {

		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}

	// 단건 조회(폰으로조회)
	public HsGusetVo selectOnePhone(HsGusetVo guestVo) {
		HsGusetVo resultVO = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT * FROM HS_GUEST WHERE HG_PHONE= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestVo.getHg_phone());
			rs = pstmt.executeQuery();
			if (rs.next()) { // 처음 커서 위치는 BOF
				resultVO = new HsGusetVo();
				resultVO.setHg_no(rs.getString("hg_no"));
				resultVO.setHg_name(rs.getString("Hg_name"));
				resultVO.setHg_phone(rs.getString("Hg_phone"));
				resultVO.setHg_sex(rs.getString("Hg_sex"));
				resultVO.setHg_birth(rs.getString("Hg_birth"));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {

		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;
	}

	// 비회원 등록
	public int insert(HsGusetVo gusetVo) {
		try {
			// 1.DB연결
			conn = ConnectionManager.getConnnect();
			// 2.SQL 구문 실행
			String sql = "INSERT INTO HS_GUEST(hg_no , hg_name, hg_phone, hg_sex, hg_birth"
					+ "VALUES (guest_seq.nextval, ?, ?, ?, ? )";
			pstmt = conn.prepareStatement(sql); // 예외처리
			pstmt.setString(1, gusetVo.getHg_no());
			pstmt.setString(2, gusetVo.getHg_name());
			pstmt.setString(3, gusetVo.getHg_phone());
			pstmt.setString(4, gusetVo.getHg_sex());
			pstmt.setString(5, gusetVo.getHg_birth());
			int r = pstmt.executeUpdate();
			// 3.결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결해제(DB에 접속 session수는 제한적 그래서 해제해야됨)
			ConnectionManager.close(conn);
		}
		return 0;
	}

}
