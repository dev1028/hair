package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MembersEventDAO {
	
	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static MembersEventDAO instance;

	public static MembersEventDAO getInstance() {
		if (instance == null)
			instance = new MembersEventDAO();
		return instance;
	}
	
	
	
}
