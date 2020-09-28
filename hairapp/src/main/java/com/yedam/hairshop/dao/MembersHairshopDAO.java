package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
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
	public List<MembersHairshopVo> hairshopIntroAll(HairshopVo hairshopVo) {
		List<MembersHairshopVo> list = new ArrayList<MembersHairshopVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_tel, h.hs_fulladdr, h.hs_starttime, h.hs_endtime, h.hs_dayoff," + 
					" count(d.designer_access_status), h.hs_parking, h.hs_etc, h.hs_name" + 
					" from hairshop h left outer join designer d" + 
					" on (h.hs_no=d.hs_no)" + 
					" where h.hs_no = ?" + 
					" group by h.hs_tel, h.hs_fulladdr, h.hs_starttime, h.hs_endtime," + 
					" h.hs_dayoff, h.hs_parking, h.hs_etc, h.hs_name";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hairshopVo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println(sql);

			while (rs.next()) {
				MembersHairshopVo members = new MembersHairshopVo();
				members.setHs_tel(rs.getString(1));
				members.setHs_fulladdr(rs.getString(2));
				members.setHs_starttime(rs.getString(3));
				members.setHs_endtime(rs.getString(4));
				members.setHs_dayoff(rs.getString(5));
				members.setDesigner_access_status(rs.getString(6));
				members.setHs_parking(rs.getString(7));
				members.setHs_etc(rs.getString(8));
				members.setHs_name(rs.getString(9));
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
