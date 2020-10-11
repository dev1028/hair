package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.TtCategoryVo;

public class TtCategoryDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static TtCategoryDAO instance;

	public static TtCategoryDAO getInstance() {
		if (instance == null)
			instance = new TtCategoryDAO();
		return instance;
	}
	
	//2020.10.10 김승연
	//시술대분류 전체조회
	public List<TtCategoryVo> selectTmacAll() {
		ResultSet rs = null;
		TtCategoryVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		List<TtCategoryVo> list = new ArrayList<TtCategoryVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT TMAC_NO, TMAC_NAME, TMAC_EXPLICATION FROM TT_MAIN_CATEGORY ORDER BY TMAC_NAME";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new TtCategoryVo();
				resultVo.setTmac_no(rs.getString("TMAC_NO"));
				resultVo.setTmac_name(rs.getString("TMAC_NAME"));
				resultVo.setTmac_explication(rs.getString("TMAC_EXPLICATION"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	}
	
	//2020.10.10 김승연
	//시술중분류 tmac_no로 조회
	public List<TtCategoryVo> selectTmicListByTmacNo(TtCategoryVo tCVo) {
		ResultSet rs = null;
		TtCategoryVo resultVo = null; 
		List<TtCategoryVo> list = new ArrayList<TtCategoryVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT TMIC_NO,TMIC_NAME,TMIC_EXPLICATION,TMAC_NO,TMIC_STATUS" + 
					" FROM TT_MIDDLE_CATEGORY" + 
					" WHERE TMIC_STATUS = 1" + 
					" AND TMAC_NO = ?" + 
					" ORDER BY TMIC_NAME";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tCVo.getTmac_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new TtCategoryVo();
				resultVo.setTmic_no(rs.getString("TMiC_NO"));
				resultVo.setTmic_name(rs.getString("TMIC_NAME"));
				resultVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				resultVo.setTmac_no(rs.getString("TMAC_NO"));
				resultVo.setTmic_status(rs.getString("TMIC_STATUS"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	}
}
