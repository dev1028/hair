package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class HairDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null; // 초기화

	static HairDAO instance;

	public static HairDAO getInstance() {
		if (instance == null)
			instance = new HairDAO();
		return instance;
	}
	
	
	JSONArray getJsonCategory(){
		JSONArray ary = new JSONArray();
		JSONObject obj = null;
		obj.put("", "");
		
		
		return null;
	}
	
	
}
