package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.CodeVo;
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

	// 2020.10.10 김승연
	// 시술대분류 전체조회
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

	// 2020.10.10 김승연
	// 시술중분류 tmac_no로 조회
	public List<TtCategoryVo> selectTmicListByTmacNo(TtCategoryVo tCVo) {
		ResultSet rs = null;
		TtCategoryVo resultVo = null;
		List<TtCategoryVo> list = new ArrayList<TtCategoryVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT TMIC_NO,TMIC_NAME,TMIC_EXPLICATION,TMAC_NO,TMIC_STATUS" + " FROM TT_MIDDLE_CATEGORY"
					+ " WHERE TMIC_STATUS = 1" + " AND TMAC_NO = ?" + " ORDER BY TMIC_NAME";
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

	// 2020.10.10
	public String selectMaxTmic_no() {
		ResultSet rs = null;
		String result = "";
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT max(tmic_no) as m" + " from tt_middle_category ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getString("m");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;

	}

	// 2020.10.10
	public List<TtCategoryVo> selectTmicAll() {
		ResultSet rs = null;
		TtCategoryVo resultVo = null;
		List<TtCategoryVo> list = new ArrayList<TtCategoryVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * "
					+ " from tt_middle_category tmic join tt_main_category tmac on(tmic.tmac_no=tmac.tmac_no)" +

					" ORDER BY TMIC_No";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new TtCategoryVo();
				resultVo.setTmic_no(rs.getString("TMiC_NO"));
				resultVo.setTmic_name(rs.getString("TMIC_NAME"));
				resultVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				resultVo.setTmac_no(rs.getString("TMAC_NO"));
				resultVo.setTmic_status(rs.getString("TMIC_STATUS"));

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

	public TtCategoryVo selectTmicOne(TtCategoryVo vo) {
		ResultSet rs = null;
		TtCategoryVo resultVo = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * "
					+ " from tt_middle_category tmic join tt_main_category tmac on(tmic.tmac_no=tmac.tmac_no)" +

					" where tmic_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTmic_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resultVo = new TtCategoryVo();
				resultVo.setTmic_no(rs.getString("TMiC_NO"));
				resultVo.setTmic_name(rs.getString("TMIC_NAME"));
				resultVo.setTmic_explication(rs.getString("TMIC_EXPLICATION"));
				resultVo.setTmac_no(rs.getString("TMAC_NO"));
				resultVo.setTmic_status(rs.getString("TMIC_STATUS"));

				resultVo.setTmac_name(rs.getString("TMAC_NAME"));
				resultVo.setTmac_explication(rs.getString("TMAC_EXPLICATION"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;

	}

	public int insertTmic(TtCategoryVo vo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "insert into tt_middle_category(tmic_no, tmac_no, tmic_explication, tmic_status) values((select max(tmic_no) from tt_middle_category)+1,?,?,1) ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getTmac_no());
			pstmt.setString(2, vo.getTmic_explication());
			r = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	public boolean hasTmicWithName(TtCategoryVo vo) {
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT * FROM tt_middle_category WHERE tmic_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTmic_name());
			rs = pstmt.executeQuery();
			return rs.next();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return false;
	}
	
	public List<TtCategoryVo> selectListRequstTmic() {
		List<TtCategoryVo> list = new ArrayList<TtCategoryVo>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					  " SELECT mid.tmic_no, mid.tmac_no, mid.tmic_name, mid.tmic_explication, mid.tmic_status, ma.tmac_name\r\n" + 
					  " FROM tt_middle_category mid, tt_main_category ma\r\n" + 
					  " WHERE tmic_status != 1\r\n" + 
					  " AND mid.tmac_no = ma.tmac_no";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TtCategoryVo vo = new TtCategoryVo();
				vo.setTmic_no(rs.getString("tmic_no"));
				vo.setTmac_no(rs.getString("tmac_no"));
				vo.setTmic_name(rs.getString("tmic_name"));
				vo.setTmic_explication(rs.getString("tmic_explication"));
				vo.setTmic_status(rs.getString("tmic_status"));
				vo.setTmac_name(rs.getString("tmac_name"));
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public int requestTmic(TtCategoryVo vo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = 
					  " INSERT INTO tt_middle_category(tmic_no, tmac_no, tmic_name, tmic_explication, tmic_status) "
					+ " VALUES((SELECT max(tmic_no) "
					+ "         FROM tt_middle_category)+1, ?, ?, ?, 0) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTmac_no());
			pstmt.setString(2, vo.getTmic_name());
			pstmt.setString(3, vo.getTmic_explication());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
	
	public int updateTmic(TtCategoryVo vo) {
		int r = 0;
		int pos = 1;

		String sql = "update  tt_middle_category set "
				+ "tmac_no=( select tmac_no from tt_main_category where tmac_name=?) ";

		String explication = ",tmic_explication=? ";

		String where = "where tmic_no=?";
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getTmic_explication() != null && !(vo.getTmic_explication().equals(""))) {
				pstmt = conn.prepareStatement(sql + explication + where);
				pstmt.setString(pos++, vo.getTmac_name());
				pstmt.setString(pos++, vo.getTmic_explication());
				pstmt.setString(pos++, vo.getTmic_no());
			} else {
				pstmt = conn.prepareStatement(sql + where);
				pstmt.setString(pos++, vo.getTmac_name());
				pstmt.setString(pos++, vo.getTmic_no());
			}

			r = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	public int approveTmic(TtCategoryVo vo) {
		int r = 0;

		String sql = "update  tt_middle_category set  tmic_status = 1 " + "where tmic_no=?";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTmic_no());

			r = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}

	public int deleteTmic(TtCategoryVo vo) {
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM tt_middle_category WHERE tmic_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTmic_no());
			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return r;
	}
}
