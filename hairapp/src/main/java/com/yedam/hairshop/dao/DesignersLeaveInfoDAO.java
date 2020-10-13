//2020.09.19 김승연

package com.yedam.hairshop.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DLeaveInfoJoinDesignerVo;
import com.yedam.hairshop.model.DesignersLeaveInfoVo;

public class DesignersLeaveInfoDAO {
	
	static Connection conn;
	PreparedStatement pstmt;

	static DesignersLeaveInfoDAO instance;

	public static DesignersLeaveInfoDAO getInstance() {
		if (instance == null)
			instance = new DesignersLeaveInfoDAO();
		return instance;
	}
	
	//미용실별 퇴사자리스트 no join
	public ArrayList<DesignersLeaveInfoVo> selectHSAll(DesignersLeaveInfoVo dVo) {
		ResultSet rs = null; // 초기화
		ArrayList<DesignersLeaveInfoVo> list = new ArrayList<DesignersLeaveInfoVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT DLI_LEAVE_DATE, DESIGNER_NO, FIN_POSITION, HIRE_DATE,"
					+ " DLI_REASON, HS_NO FROM DESIGNERS_LEAVE_INFO"
					+ " WHERE HS_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DesignersLeaveInfoVo resultVo = new DesignersLeaveInfoVo();
				resultVo.setDli_leave_date(rs.getString("DLI_LEAVE_DATE"));
				resultVo.setDesigner_no(rs.getString("DESIGNER_NO"));
				resultVo.setFin_position(rs.getString("FIN_POSITION"));
				resultVo.setHire_date(rs.getString("HIRE_DATE"));
				resultVo.setDli_reason(rs.getString("DLI_REASON"));
				resultVo.setHs_no(rs.getString("HS_NO"));
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//미용실별 퇴사자리스트 use join
	public ArrayList<DLeaveInfoJoinDesignerVo> selectHSAll(DLeaveInfoJoinDesignerVo dVo) {
		ResultSet rs = null; // 초기화
		ArrayList<DLeaveInfoJoinDesignerVo> list = new ArrayList<DLeaveInfoJoinDesignerVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT dli.DLI_LEAVE_DATE,dli.DESIGNER_NO,dli.HIRE_DATE,dli.HS_NO,dli.FIN_POSITION,dli.DLI_REASON,"
					+" d.DESIGNER_NAME,d.DESIGNER_PHONE,d.DESIGNER_EMAIL,d.FILE_NAME"
					+" FROM DESIGNER d INNER JOIN DESIGNERS_LEAVE_INFO dli"
					+" ON(dli.DESIGNER_NO = d.DESIGNER_NO)"
					+" WHERE dli.HS_NO = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DLeaveInfoJoinDesignerVo resultVo = new DLeaveInfoJoinDesignerVo();
				resultVo.setDli_leave_date(rs.getString("DLI_LEAVE_DATE"));
				resultVo.setDesigner_no(rs.getString("DESIGNER_NO"));
				resultVo.setHire_date(rs.getString("HIRE_DATE"));
				resultVo.setHs_no(rs.getString("HS_NO"));
				resultVo.setFin_position(rs.getString("FIN_POSITION"));
				resultVo.setDli_reason(rs.getString("DLI_REASON"));
				resultVo.setDesigner_name(rs.getString("DESIGNER_NAME"));
				resultVo.setDesigner_phone(rs.getString("DESIGNER_PHONE"));
				resultVo.setDesigner_email(rs.getString("DESIGNER_EMAIL"));
				resultVo.setFile_name(rs.getString("FILE_NAME"));
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//2020-09-22 김승연
	//직원퇴사 처리 프로시저  // 7번이 해당처리가 정상적으로 되었는지 리턴함
	/*
	create or replace procedure fire_designer
	(v_dli_leave_date IN VARCHAR2,
	v_designer_no IN VARCHAR2,
	v_hs_no IN VARCHAR2,
	v_hire_date IN VARCHAR2,
	v_fin_position IN DESIGNERS_LEAVE_INFO.FIN_POSITION%TYPE,
	v_dli_reason IN DESIGNERS_LEAVE_INFO.DLI_REASON%TYPE,
	v_cnt out number)
	IS
	BEGIN
	  INSERT INTO DESIGNERS_LEAVE_INFO (dli_leave_date, designer_no, dli_reason, fin_position, hs_no, hire_date)
	  VALUES (TO_DATE(v_dli_leave_date, 'YYYY/MM/DD hh24:MI:SS'), to_number(v_designer_no), v_dli_reason, v_fin_position, to_number(v_hs_no), TO_DATE(v_hire_date,'YYYY/MM/DD HH24:MI:SS'));
	  
	  UPDATE designer SET designer_dayoff = null, work_start_time = null, position = null, salary = null, incentive = null, hire_date = null, designer_profile = null, hs_no = null
	  WHERE designer_no = to_number(v_designer_no);
	  
	  select count(v_designer_no)
	  into v_cnt
	  from DESIGNERS_LEAVE_INFO
	  where designer_no = to_number(v_designer_no);
	  
	  commit;
	END fire_designer;
	*/
	
	public int fireDesigner(DesignersLeaveInfoVo dVo) {
		ResultSet rs = null; // 초기화
		int isInsert = 0;
		try {
			conn = ConnectionManager.getConnnect();
			CallableStatement pstmt = conn.prepareCall
				     ("{call fire_designer(?,?,?,?,?,?,?)}");
			pstmt.setString(1, dVo.getDli_leave_date());
			pstmt.setString(2, dVo.getDesigner_no());
			pstmt.setString(3, dVo.getHs_no());
			pstmt.setString(4, dVo.getHire_date());
			pstmt.setString(5, dVo.getFin_position());
			pstmt.setString(6, dVo.getDli_reason());
			pstmt.registerOutParameter(7, Types.INTEGER);
			pstmt.executeUpdate();
			isInsert = pstmt.getInt(7);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		
		return isInsert;
	}
	
	
}
