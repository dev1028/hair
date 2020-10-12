package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HsPhotoVo;

public class HsPhotoDAO {
	// 전역변수
	static Connection conn;
	PreparedStatement pstmt;
	

	// 싱글톤
	static HsPhotoDAO instance;

	public static HsPhotoDAO getInstance() {
		if (instance == null)
			instance = new HsPhotoDAO();
		return instance;
	}
	
	// 2020.10.11 김승연
	// 사진넣기
	public int insert(HsPhotoVo hPVo) {
		int r = 0;
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO HS_PHOTO (HSP_NO,HS_NO,HSP_FILE)" + 
					" VALUES ((SELECT NVL(MAX(HSP_NO),0)+1 FROM HS_PHOTO WHERE HS_NO = ?),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hPVo.getHs_no());
			pstmt.setString(2, hPVo.getHs_no());
			pstmt.setString(3, hPVo.getHsp_file());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return r;
	}
	
	//2020.10.12 김승연
	//미용실별 헤어샵사진 가져오기
	public List<HsPhotoVo> selectByHairshop(HsPhotoVo hPVo){
		ResultSet rs = null;
		List<HsPhotoVo> list = new ArrayList<HsPhotoVo>(); 
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "SELECT HSP_NO, HS_NO, HSP_FILE FROM HS_PHOTO WHERE HS_NO = ?";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, hPVo.getHs_no()); 
			rs = pstmt.executeQuery();
			while (rs.next()) { 
				HsPhotoVo resultVO = new HsPhotoVo(); 
				resultVO.setHsp_no(rs.getString("HSP_NO"));
				resultVO.setHs_no(rs.getString("HS_NO"));
				resultVO.setHsp_file(rs.getString("HSP_FILE"));
			
				list.add(resultVO); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}
}
