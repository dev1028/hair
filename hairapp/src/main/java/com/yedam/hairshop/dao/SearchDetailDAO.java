package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.SearchDetailVo;
import com.yedam.hairshop.model.SearchVo;

public class SearchDetailDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static SearchDetailDAO instance = null;
	public static SearchDetailDAO getInstance(){
		if(instance == null)
			instance = new SearchDetailDAO();
		return instance;
	}
	
	public List<SearchDetailVo> selectListHairshop(SearchDetailVo vo) {
		List<SearchDetailVo> list = new ArrayList<SearchDetailVo>();
		try {
			String sql = "SELECT hs_no, hs_name, hs_profile " + 
						" FROM hairshop " + 
						" WHERE hs_name LIKE '%'|| ? || '%' OR " + 
						"      hs_profile LIKE '%' || ? || '%' OR " + 
						"      hs_fulladdr LIKE '%' || ? || '%' ";
//			System.out.println(sql);
			
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getLabel());
			pstmt.setString(2, vo.getLabel());
			pstmt.setString(3, vo.getLabel());

			//vo.getTimeStart();
			//vo.getTimeEnd();
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchDetailVo tmpVo = new SearchDetailVo();
				tmpVo.setValue(rs.getString(1));
				tmpVo.setLabel(rs.getString(2));
				tmpVo.setDesc(rs.getString(3));
				list.add(tmpVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}	
}
