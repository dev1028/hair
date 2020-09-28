package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DesignerBookmarkDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static DesignerBookmarkDAO instance;

	public static DesignerBookmarkDAO getInstance() {
		if (instance == null)
			instance = new DesignerBookmarkDAO();
		return instance;
	}
	
	
}
