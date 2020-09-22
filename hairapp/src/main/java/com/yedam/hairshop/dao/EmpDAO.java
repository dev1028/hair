package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.EmpVo;

public class EmpDAO {
	
	// 전역변수
		static Connection conn;
		PreparedStatement pstmt;
		ResultSet rs = null;

		// 싱글톤
		static EmpDAO instance;

		public static EmpDAO getInstance() {
			if (instance == null)
				instance = new EmpDAO();
			return instance;
		}
		
		// 단건 조회
		public EmpVo loginSelectOne(EmpVo empVo) {
			EmpVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언

			try {
				conn = ConnectionManager.getConnnect();
				String sql = "SELECT emp_NO,emp_NAME,emp_hiredate,emp_phone,emp_EMAIL,emp_password,emp_department,emp_position, emp_alias "+
							" FROM employees" + 
							" WHERE emp_EMAIL = ?" + 
							" AND emp_password =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, empVo.getEmp_email());
				pstmt.setString(2, empVo.getEmp_password());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					resultVo = new EmpVo();
					resultVo.setEmp_no(rs.getString("emp_NO"));
					resultVo.setEmp_name(rs.getString("emp_NAME"));
					resultVo.setEmp_hiredate(rs.getString("emp_hiredate"));
					resultVo.setEmp_phone(rs.getString("emp_phone"));
					resultVo.setEmp_email(rs.getString("emp_EMAIL"));
					resultVo.setEmp_password(rs.getString("emp_password"));
					resultVo.setEmp_department(rs.getString("emp_department"));
					resultVo.setEmp_position(rs.getString("emp_position"));
					resultVo.setEmp_alias(rs.getString("emp_alias"));
					
					
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
