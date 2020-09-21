package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null; // 초기화

	static DesignerDAO instance;

	public static DesignerDAO getInstance() {
		if (instance == null)
			instance = new DesignerDAO();
		return instance;
	}

	// 디자이너 정보 추가
	public int update(DesignerVo designerVo) {
		int r = 0;
		String sql = "UPDATE DESIGNER SET DESIGNER_PW = ?, DESIGNER_PHONE = ?, DESIGNER_DAYOFF = ? ,"
				+ " WORK_START_TIME = ?, WORK_END_TIME = ?, HIRE_DATE = ? , DESIGNER_PROFILE = ? WHERE DESIGNER_NO = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, designerVo.getDesigner_pw());
			pstmt.setString(2, designerVo.getDesigner_phone());
			pstmt.setString(3, designerVo.getDesigner_dayoff());
			pstmt.setString(4, designerVo.getWork_start_time());
			pstmt.setString(5, designerVo.getWork_end_time());
			pstmt.setString(6, designerVo.getHire_date());
			pstmt.setString(7, designerVo.getDesigner_profile());
			pstmt.setString(8, designerVo.getDesigner_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}

	// 단건 조회
	public DesignerVo selectOne(DesignerVo designerVo) {
		DesignerVo resultVO = null;

		try {
			conn = ConnectionManager.getConnnect();
			String sql = " SELECT * FROM DESIGNER WHERE DESIGNER_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, designerVo.getDesigner_no());
			rs = pstmt.executeQuery();
			if (rs.next()) { // 처음 커서 위치는 BOF
				resultVO = new DesignerVo();
				resultVO.setDesigner_no(rs.getString(1));
				resultVO.setDesigner_name(rs.getString(2));
				resultVO.setDesigner_email(rs.getString(4));
			} else {
				System.out.println("no data");
			}
		} catch (Exception e) {

		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVO;

	}

	// 로그인시 아이디, 비밀번호 체크 메서드
	// 아이디, 비밀번호를 인자로 받는다.
	public int loginCheck(String email, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
		int x = -1;

		try {
			// 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM DESIGNER WHERE DESIGNER_EMAIL= ?");

			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			{
				dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
				if (dbPW.equals(pw))
					x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
				else
					x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
			} else {
				x = -1; // 해당 아이디가 없을 경우
			} return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()

	
	// 미용실별 디자이너 목록
	// 2020.09.17 승연
	public ArrayList<DesignerVo> selectByHairShop(DesignerVo dVo) {
		ArrayList<DesignerVo> list = new ArrayList<DesignerVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT DESIGNER_NO,DESIGNER_NAME,DESIGNER_PHONE,DESIGNER_EMAIL,DESIGNER_PW,"
					+ " DESIGNER_DAYOFF,WORK_START_TIME,WORK_END_TIME,DESIGNER_ACCESS_STATUS,POSITION,"
					+ " SALARY,INCENTIVE,HIRE_DATE,HS_NO,DESIGNER_PROFILE,FILE_NAME" + " FROM DESIGNER"
					+ " WHERE HS_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getHs_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DesignerVo designer = new DesignerVo();
				designer.setDesigner_no(rs.getString("DESIGNER_NO"));
				designer.setDesigner_name(rs.getString("DESIGNER_NAME"));
				designer.setDesigner_phone(rs.getString("DESIGNER_PHONE"));
				designer.setDesigner_email(rs.getString("DESIGNER_EMAIL"));
				designer.setDesigner_pw(rs.getString("DESIGNER_PW"));
				designer.setDesigner_dayoff(rs.getString("DESIGNER_DAYOFF"));
				designer.setWork_start_time(rs.getString("WORK_START_TIME"));
				designer.setWork_end_time(rs.getString("WORK_END_TIME"));
				designer.setDesigner_access_status(rs.getString("DESIGNER_ACCESS_STATUS"));
				designer.setPosition(rs.getString("POSITION"));
				designer.setSalary(rs.getString("SALARY"));
				designer.setIncentive(rs.getString("INCENTIVE"));
				designer.setHire_date(rs.getString("HIRE_DATE"));
				designer.setHs_no(rs.getString("HS_NO"));
				designer.setDesigner_profile(rs.getString("DESIGNER_PROFILE"));
				designer.setFile_name(rs.getString("FILE_NAME"));
				list.add(designer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	// 디자이너 간편등록
	// 2020.09.18
	public int simpleInsert(DesignerVo dVo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO DESIGNER" + "(DESIGNER_NO, DESIGNER_NAME, DESIGNER_PHONE, DESIGNER_EMAIL, "
					+ "DESIGNER_PW, DESIGNER_ACCESS_STATUS, HS_NO)" + " VALUES(DESIGNER_NO_SEQ.NEXTVAL,?,?,?,?,-1,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getDesigner_name());
			pstmt.setString(2, dVo.getDesigner_phone());
			pstmt.setString(3, dVo.getDesigner_email());
			pstmt.setString(4, dVo.getDesigner_pw());
			pstmt.setString(5, dVo.getHs_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	// 2020.09.20 김승연
	// 미용실에서 디자이너 정보 수정
	public int updateForHair(DesignerVo designerVo) {
		int r = 0;
		String sql = "UPDATE DESIGNER SET POSITION = ?, SALARY = ?, INCENTIVE = ?, DESIGNER_PHONE = ?, DESIGNER_DAYOFF = ?,"
				+ " WORK_START_TIME = ?, WORK_END_TIME = ?, DESIGNER_PROFILE = ?, FILE_NAME = ?"
				+ " WHERE DESIGNER_NO = ?";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, designerVo.getPosition());
			pstmt.setString(2, designerVo.getSalary());
			pstmt.setString(3, designerVo.getIncentive());
			pstmt.setString(4, designerVo.getDesigner_phone());
			pstmt.setString(5, designerVo.getDesigner_dayoff());
			pstmt.setString(6, designerVo.getWork_start_time());
			pstmt.setString(7, designerVo.getWork_end_time());
			pstmt.setString(8, designerVo.getDesigner_profile());
			pstmt.setString(9, designerVo.getFile_name());
			pstmt.setString(10, designerVo.getDesigner_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

}
