package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
					+ " where r.mdr_status = 'i2' " + " order by 2 desc";
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

	// 예약 상세 보기
	public List<MembersReservationVo> drHairshop(MembersReservationVo membersReservationVo) {
		List<MembersReservationVo> list = new ArrayList<MembersReservationVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_name, r.mdr_date, r.mdr_no, r.mdr_status, m.mem_no, d.designer_name, "
					+ " r.mdr_category_code, r.mdr_online_price, r.mdr_request, m.mem_hair_length, m.mem_hair_status "
					+ " from hairshop h join designer d " + " on(h.hs_no=d.hs_no) join members_designer_rsv r "
					+ " on(d.designer_no=r.designer_no) join members m " + " on(r.mem_no=m.mem_no) "
					+ " where r.mdr_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersReservationVo.getMdr_no()); // ?의 첫번째 자리에 올 값 지정
			rs = pstmt.executeQuery();
			System.out.println(sql);
			while (rs.next()) {
				MembersReservationVo membersR = new MembersReservationVo();
				String hsName = rs.getString(1);
				membersR.setHs_name(hsName);
				membersR.setMdr_date(rs.getString(2));
				membersR.setMdr_no(rs.getString(3));
				membersR.setMdr_status(rs.getString(4));
				membersR.setMem_no(rs.getString(5));
				membersR.setDesigner_name(rs.getString(6));
				membersR.setMdr_category_code(rs.getString(7));
				membersR.setMdr_online_price(rs.getString(8));
				membersR.setMdr_request(rs.getString(9));
				membersR.setMem_hair_length(rs.getString(10));
				membersR.setMem_hair_status(rs.getString(11));

				list.add(membersR); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// 예약한 적 있는 미용실 조회
	public List<MembersReservationVo> OnceVisitedHS() {
		List<MembersReservationVo> list = new ArrayList<MembersReservationVo>();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select h.hs_name, r.mdr_date, r.mdr_no, r.mdr_status,"
					+ " m.mem_no, d.designer_name, p.hsp_file " + " from hs_photo p join hairshop h "
					+ " on(p.hs_no=h.hs_no) join designer d " + " on(h.hs_no=d.hs_no) join members_designer_rsv r "
					+ " on(d.designer_no=r.designer_no) join members m " + " on(r.mem_no=m.mem_no) "
					+ " where r.mdr_status = 'i2' " + " order by 2 desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			while (rs.next()) {
				MembersReservationVo members = new MembersReservationVo();
				String hsName = rs.getString(1);
				members.setHs_name(hsName);
				members.setMdr_date(rs.getString(2));
				members.setMdr_no(rs.getString(3));
				members.setMdr_status(rs.getString(4));
				members.setMem_no(rs.getString(5));
				members.setDesigner_name(rs.getString(6));
				members.setHsp_file(rs.getString(7));

				list.add(members); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// 2020.09.25 김승연
	// 미용실용 회원 예약내역 조회
	public List<Map<String, String>> selectReservationList() {
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select mdr_no, to_char(mdr_date, 'YYYY/MM/DD HH24:MI') as mdr_date, mdr_status, mem_no, mem_name,"
					+" designer_no, designer_name, mdri_detail_info," 
					+" hhi_no, hhi_name, hhi_time from reservation_list"
					+" where mdr_status != 'i1'"
					+" and hs_no = ?"
					+" and mdr_date between to_date(?,'YYYY/MM/DD') and to_date(?,'YYYY/MM/DD')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "");
			pstmt.setString(2, "");
			pstmt.setString(3, "");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("mdr_no", rs.getString("mdr_no"));
				map.put("mdr_date", rs.getString("mdr_date"));
				map.put("mdr_status", rs.getString("mdr_status"));
				map.put("mem_no", rs.getString("mem_no"));
				map.put("mem_name", rs.getString("mem_name"));
				map.put("designer_no", rs.getString("designer_no"));
				map.put("designer_name", rs.getString("designer_name"));
				map.put("mdri_detail_info", rs.getString("mdri_detail_info"));
				map.put("hhi_no", rs.getString("hhi_no"));
				map.put("hhi_name", rs.getString("hhi_name"));
				map.put("hhi_time", rs.getString("hhi_time"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}

}
