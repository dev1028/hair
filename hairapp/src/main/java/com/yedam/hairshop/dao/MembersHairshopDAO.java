package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHairshopDAO {

	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static MembersHairshopDAO instance;

	public static MembersHairshopDAO getInstance() {
		if (instance == null)
			instance = new MembersHairshopDAO();
		return instance;
	}

	// 헤어샵 정보 보여주기
	public MembersHairshopVo selectOne(HairshopVo hairshopVo) {
		MembersHairshopVo members = null;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_tel, h.hs_fulladdr, h.hs_starttime, h.hs_endtime, h.hs_dayoff,"
					+ " count(d.designer_access_status), h.hs_parking, h.hs_etc, h.hs_name, h.hs_latlong"
					+ " from hairshop h left outer join designer d" + " on (h.hs_no=d.hs_no)"
					+ " where h.hs_no = ?"
					+ " group by h.hs_tel, h.hs_fulladdr, h.hs_starttime, h.hs_endtime,"
					+ 			" h.hs_dayoff, h.hs_parking, h.hs_etc, h.hs_name, h.hs_latlong";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("헤어샵정보: "+ sql);

			if(rs.next()) {
				members = new MembersHairshopVo();
				members.setHs_tel(rs.getString(1));
				members.setHs_fulladdr(rs.getString(2));
				members.setHs_starttime(rs.getString(3));
				members.setHs_endtime(rs.getString(4));
				members.setHs_dayoff(rs.getString(5));
				members.setDesigner_access_status(rs.getString(6));
				members.setHs_parking(rs.getString(7));
				members.setHs_etc(rs.getString(8));
				members.setHs_name(rs.getString(9));
				members.setHs_latlong(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return members; // 값을 리턴해줌
	}

	// 디자이너 정보 보여주기
	public List<MembersHairshopVo> designerIntroAll(HairshopVo hairshopVo) {
		List<MembersHairshopVo> list = new ArrayList<MembersHairshopVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select designer_name, position, designer_profile, hs_no, file_name" + 
					" from designer" + 
					" where designer_access_status = 1" + 
					" and hs_no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("디자이너정보: "+sql);

			while (rs.next()) {
				MembersHairshopVo members = new MembersHairshopVo();
				members.setDesigner_name(rs.getString(1));
				members.setPosition(rs.getString(2));
				members.setDesigner_profile(rs.getString(3));
				members.setHs_no(rs.getString(4));
				members.setFile_name(rs.getString(5));
				list.add(members); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

}
