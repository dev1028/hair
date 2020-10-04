package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairMainCategoryVo;
import com.yedam.hairshop.model.HairMiddleCategoryVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class HairCategoryDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null; // 초기화

	static HairCategoryDAO instance;

	public static HairCategoryDAO getInstance() {
		if (instance == null)
			instance = new HairCategoryDAO();
		return instance;
	}
	
	
	public List<HairMainCategoryVo> getListMainCategory(){
		List<HairMainCategoryVo> list = new ArrayList<HairMainCategoryVo>();
		try {
			String sql = "SELECT TMAC_NO, TMAC_NAME FROM tt_main_category";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HairMainCategoryVo vo = new HairMainCategoryVo();
				vo.setTmac_no("TMAC_NO");
				vo.setTmac_name("TMAC_NAME");
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
	} 
	
	public List<HairMiddleCategoryVo> getListMiddleCategory(String tmac_no){
		List<HairMiddleCategoryVo> list = new ArrayList<HairMiddleCategoryVo>();
		try {
			String sql = "SELECT TMIC_NO, TMIC_NAME FROM tt_middle_category WHERE TMAC_NO = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tmac_no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HairMiddleCategoryVo vo = new HairMiddleCategoryVo();
				vo.setTmac_no(tmac_no);
				vo.setTmic_no("TMIC_NO");
				vo.setTmic_name("TMIC_NAME");
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
	}

	/*
	JSONArray getJsonCategory(){
		List<HairMainCategoryVo> listMain = getListMainCategory();
		
		
		for(HairMainCategoryVo main : listMain) {
			JSONObject objMain = new JSONObject();
			
			
//			List<HairMiddleCategoryVo> listMiddle = getListMiddleCategory(main.getTmac_no());
//			JSONArray jsonArray = new JSONArray();
//			for(HairMiddleCategoryVo middle : listMiddle) {
//				JSONObject obj = new JSONObject();
//				obj.put("TMIC_NO", middle.getTmic_no());
//				obj.put("TMIC_NAME", middle.getTmic_name());
//				jsonArray.add(obj);
//			}
			
			
		}
		
		JSONArray ary = new JSONArray();
		JSONObject obj = null;
		obj.put("", "");
		
		
		return null;
	}
	*/
	
}
