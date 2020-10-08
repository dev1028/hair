package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.SearchVo;
 
public class SearchDAO {
	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	
	static SearchDAO instance = null;
	public static SearchDAO getInstance(){
		if(instance == null)
			instance = new SearchDAO();
		return instance;
	}
	//vo.label이 keyword로 사용된다.
	//결과값으로
	//value 값은  hairshop number 가
	//label hairshop 제목
	//hairshop정보에서 매칭되는 hairshop을 찾아온다.
	public List<SearchVo> selectListHairshop(SearchVo vo) {
		ResultSet rs = null;
		if(vo.getLabel() == null)
			return null;
		
		List<SearchVo> list = new ArrayList<SearchVo>();
		try {
			String sql = "SELECT hs_no, hs_name, hs_profile " + 
						" FROM hairshop " + 
						" WHERE hs_name LIKE '%' || ? || '%'";
//						" WHERE hs_name LIKE '%'|| ? || '%' OR " + 
//						"      hs_profile LIKE '%' || ? || '%' OR " + 
//						"      hs_fulladdr LIKE '%' || ? || '%' ";
//			System.out.println(sql);
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getLabel());
//			pstmt.setString(2, vo.getLabel());
//			pstmt.setString(3, vo.getLabel());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchVo tmpVo = new SearchVo();
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
	
	public List<SearchVo> selectListHairshopFromDesigner(SearchVo vo) {
		ResultSet rs = null;
		List<SearchVo> list = new ArrayList<SearchVo>();
		try {
			//나중에 design name, design profile이 select되도록 변경해야 함.
			//where 조건절에서도 designer profile이 검색대상에 포함되도록 변경해야한다.
			String sql = " SELECT distinct(h.hs_no), h.hs_name, h.hs_profile " + 
						 " FROM designer d, hairshop h " + 
						 " WHERE d.hs_no = h.hs_no AND " + 
						 " d.designer_name = '%' || '?' || '%';";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SearchVo tmpVo = new SearchVo();
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
