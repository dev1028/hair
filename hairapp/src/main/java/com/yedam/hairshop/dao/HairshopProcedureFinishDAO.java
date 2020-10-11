package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.HairshopProcedureFinishVo;

public class HairshopProcedureFinishDAO {
	static Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static HairshopProcedureFinishDAO instance;

	public static HairshopProcedureFinishDAO getInstance() {
		if (instance == null)
			instance = new HairshopProcedureFinishDAO();
		return instance;
	}

	public ArrayList<HairshopProcedureFinishVo> selectAll(HairshopProcedureFinishVo vo) {
		System.out.println("시술완료고객");
		ResultSet rs = null;
		ArrayList<HairshopProcedureFinishVo> list = new ArrayList<HairshopProcedureFinishVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = " select a.mdr_date, a.mdr_no, b.hhi_no, a.designer_no, c.hhi_price, d.designer_name, m.mem_name, c.hhi_name "
					+ " from members_designer_rsv a, mem_designer_rsv_info b, hairshop_hair_info c, designer d, members m "
					+ " where mdr_status = 'i4' "
					+ " and a.mdr_no = b.mdr_no and c.hhi_no = b.hhi_no and a.designer_no = d.designer_no and m.mem_no = a.mem_no"
					+ " and a.hs_no = ?" + " order by a.mdr_date";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			System.out.println(vo.getHs_no());

			pstmt.setString(1, vo.getHs_no());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				HairshopProcedureFinishVo resultVo = new HairshopProcedureFinishVo();
				resultVo.setMdr_date((rs.getString("mdr_date")).substring(0, 16));
				resultVo.setMdr_no(rs.getString("mdr_no"));
				resultVo.setHhi_no(rs.getString("hhi_no"));
				resultVo.setHhi_name(rs.getString("hhi_name"));
				resultVo.setDesigner_no(rs.getString("designer_no"));
				resultVo.setHhi_price(rs.getString("hhi_price"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				resultVo.setMem_name(rs.getString("mem_name"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//시술완료고객 디자이너로 검색
	public ArrayList<HairshopProcedureFinishVo> finishDesigner(HairshopProcedureFinishVo finishVo) {
		System.out.println("시술완료고객 디자이너로 검색");
		ResultSet rs = null;
		ArrayList<HairshopProcedureFinishVo> list = new ArrayList<HairshopProcedureFinishVo>();
		String searchDesigner = " and d.designer_name like '%'||?||'%'";
		try {
			conn = ConnectionManager.getConnnect();
			String sql = " select a.mdr_date, a.mdr_no, b.hhi_no, a.designer_no, c.hhi_price, d.designer_name, m.mem_name, c.hhi_name"
					+ " from members_designer_rsv a, mem_designer_rsv_info b, hairshop_hair_info c, designer d, members m"
					+ "	where mdr_status = 'i4'"
					+ "	and a.mdr_no = b.mdr_no and c.hhi_no = b.hhi_no and a.designer_no = d.designer_no and m.mem_no = a.mem_no"
					+ "	and a.hs_no = ?  ";
			if (!(searchDesigner == null || searchDesigner.equals(""))){
				sql = sql+ searchDesigner;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, finishVo.getHs_no());
			
			//if(searchDesigner.equals("designer_name")) { 잘몬된거
			if(!(searchDesigner == null || searchDesigner.equals(""))) {
				pstmt.setString(2, finishVo.getDesigner_name());
			}
			System.out.println(sql);
			System.out.println(finishVo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("aaa" + finishVo.getDesigner_name());
			while(rs.next()) {
				HairshopProcedureFinishVo resultVo = new HairshopProcedureFinishVo();
				resultVo.setMdr_date((rs.getString("mdr_date")).substring(0, 16));
				resultVo.setMdr_no(rs.getString("mdr_no"));
				resultVo.setHhi_no(rs.getString("hhi_no"));
				resultVo.setHhi_name(rs.getString("hhi_name"));
				resultVo.setDesigner_no(rs.getString("designer_no"));
				resultVo.setHhi_price(rs.getString("hhi_price"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				resultVo.setMem_name(rs.getString("mem_name"));
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
