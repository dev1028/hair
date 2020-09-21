package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.MembersReservationVo;

public class MembersReservationDAO {

	// 전역변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	// 싱글톤
	static MembersReservationDAO instance;

	public static MembersReservationDAO getInstance() {
		if (instance == null)
			instance = new MembersReservationDAO();
		return instance;
	}

	// 전체 예약 내역 조회
	public List<MembersReservationVo> reservationAll() {
		List<MembersReservationVo> list = new ArrayList<MembersReservationVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_name, r.mdr_date, r.mdr_no, r.mdr_status, m.mem_no, d.designer_name "
					+ " from hairshop h join designer d " + " on(h.hs_no=d.hs_no) join members_designer_rsv r "
					+ " on(d.designer_no=r.designer_no) join members m " + " on(r.mem_no=m.mem_no) "
					+ " order by 2 desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MembersReservationVo membersR = new MembersReservationVo();
				String hsName = rs.getString(1);
				membersR.setHs_name(hsName);
				membersR.setMdr_date(rs.getString(2));
				membersR.setMdr_no(rs.getString(3));
				membersR.setMdr_status(rs.getString(4));
				membersR.setMem_no(rs.getString(5));
				membersR.setDesigner_name(rs.getString(6));
				list.add(membersR); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// 예약중인 헤어샵 조회
	public List<MembersReservationVo> bookingAll() {
		List<MembersReservationVo> list = new ArrayList<MembersReservationVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_name, r.mdr_date, r.mdr_no, r.mdr_status, m.mem_no, d.designer_name "
					+ " from hairshop h join designer d " + " on(h.hs_no=d.hs_no) join members_designer_rsv r "
					+ " on(d.designer_no=r.designer_no) join members m " + " on(r.mem_no=m.mem_no) "
					+ " where r.mdr_status = 'i2' "
					+ " order by 2 desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MembersReservationVo membersR = new MembersReservationVo();
				String hsName = rs.getString(1);
				membersR.setHs_name(hsName);
				membersR.setMdr_date(rs.getString(2));
				membersR.setMdr_no(rs.getString(3));
				membersR.setMdr_status(rs.getString(4));
				membersR.setMem_no(rs.getString(5));
				membersR.setDesigner_name(rs.getString(6));
				list.add(membersR); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

}
