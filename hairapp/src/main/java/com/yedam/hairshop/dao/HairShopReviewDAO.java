package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.QnaVo;

public class HairShopReviewDAO {
	static HairShopReviewDAO instance;
	static Connection conn;
	PreparedStatement pstmt;
	
	static public HairShopReviewDAO getInstance() {
		if(instance == null)
			instance = new HairShopReviewDAO();
		return instance;
	}
	
	public int updateReview(HairShopReviewVo vo) {
		ResultSet rs = null;
		int r = 0;
		try {
			String sql = "UPDATE hairshop_reviews SET hr_rate = ?, hr_contents = ? WHERE mdr_no = ?";
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHr_rate());
			pstmt.setString(2, vo.getHr_contents());
			pstmt.setString(3, vo.getMdr_no());
			r = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}
	
	public int insertReview(HairShopReviewVo vo) {
		ResultSet rs = null;
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			//CallableStatement cstmt = conn.prepareCall("{call insertHairShopReview(?, ?, ?, ?)}");
			//hairshop_reviews_seq.nextval
//			cstmt.setString(1, vo.getMdr_no());
//			cstmt.setString(2, vo.getHr_rate());
//			cstmt.setString(3, vo.getHr_contents());
//			cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
//			cstmt.execute();
			
			/////////////////////////////////////////////////////////////////////////
			String sql = "INSERT INTO hairshop_reviews(hr_no, hr_rate, hr_contents, hr_writedate, hs_no, mdr_no, designer_no, hr_writer) "
					+ "VALUES(hairshop_reviews_seq.NEXTVAL, ?, ?, sysdate, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHr_rate());
			pstmt.setString(2, vo.getHr_contents());
			pstmt.setString(3, vo.getHs_no());
			pstmt.setString(4, vo.getMdr_no());
			pstmt.setString(5,  vo.getDesigner_no());
			pstmt.setString(6,  vo.getHr_writer());
			r = pstmt.executeUpdate();
			System.out.println(r + "값 처리 됨");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}
	
	public HairShopReviewVo selectReview(HairShopReviewVo vo) {
		ResultSet rs = null;
		HairShopReviewVo resultVo = null;
		try {
			String sql = "SELECT hr_rate, hr_contents "
					+ "FROM hairshop_reviews "
					+ "WHERE mdr_no = ? ";
					
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMdr_no());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultVo = new HairShopReviewVo();
				resultVo.setHr_rate(rs.getString(1));
				resultVo.setHr_contents(rs.getString(2));
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	}
	
	
	
	// 린아타임
	
	// 미용실에 후기 뿌리기
	public ArrayList<HairShopReviewVo> selectHsReivew(HairShopReviewVo hairShopReviewVo) {
		ResultSet rs = null;
		HairShopReviewVo resultVO = null;
		ArrayList<HairShopReviewVo> list = new ArrayList<HairShopReviewVo>();
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "select hr_no, hr_rate, hr_contents, hr_writedate,"
					+ "	replace(hr_writer,substr(hr_writer,2,1),'*') as hr_writer, mdr_no" 
					+ "	from hairshop_reviews"
					+ "	where hs_no= ?"
					+ "	order by hr_writedate desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairShopReviewVo.getHs_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVO = new HairShopReviewVo();
				resultVO.setHr_no(rs.getString("hr_no"));
				resultVO.setHr_rate(rs.getString("hr_rate"));
				resultVO.setHr_contents(rs.getString("hr_contents"));
				resultVO.setHr_writedate(rs.getString("hr_writedate"));
				resultVO.setHr_writer(rs.getString("hr_writer"));
				resultVO.setMdr_no(rs.getString("mdr_no"));
				list.add(resultVO); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}
	
	
	// 린아타임끝
	
	
}
