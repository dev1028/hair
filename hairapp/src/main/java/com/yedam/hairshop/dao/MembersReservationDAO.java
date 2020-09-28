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
			String sql = "select h.hs_name, r.mdr_date, r.mdr_no, r.mdr_status, m.mem_no, " + 
					" d.designer_name, r.mdr_request, m.mem_hair_length, " + 
					" m.mem_hair_status, e.mdp_no, e.mdp_price, i.hhi_no, i.hhi_name " + 
					" from members_detail_paylist e join members_designer_rsv r " + 
					" on(e.mdr_no=r.mdr_no) join designer d"  + 
					" on(r.designer_no=d.designer_no) join hairshop_hair_info i " + 
					" on(d.hs_no=i.hs_no) join hairshop h " + 
					" on(i.hs_no=h.hs_no) join hair_member_info a " + 
					" on(h.hs_no=a.hs_no) join members m " + 
					" on(a.mem_no=m.mem_no) " +
					" where r.mdr_no = ?";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			System.out.println(membersReservationVo.getMdr_no());
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
				membersR.setMdr_request(rs.getString(7));
				membersR.setMem_hair_length(rs.getString(8));
				membersR.setMem_hair_status(rs.getString(9));
				membersR.setMdp_no(rs.getString(10));
				membersR.setMdp_price(rs.getString(11));
				membersR.setHhi_no(rs.getString(12));
				membersR.setHhi_name(rs.getString(13));

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
	// 미용실용 회원 예약시간 조회
	public List<Map<String, String>> selectReservationList(String hsNo, String startDate,String endDate) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select mdr.mdr_no, to_char(mdr.mdr_date, 'YYYY-MM-DD HH24:MI') as mdr_date, mdr.mdr_status, mdr.mem_no, m.mem_name,"
					+ " mdr.designer_no, d.designer_name, to_char(mdr.mdr_date+c.sum_time/24, 'YYYY-MM-DD HH24:MI') as sum_time" 
					+ " from members_designer_rsv mdr join designer d"
					+ " on (mdr.DESIGNER_NO = d.designer_no)" 
					+ " join members m" 
					+ " on(mdr.mem_no = m.mem_no)"
					+ " join (select mdri.mdr_no as mdr_no, sum(hhi.HHI_TIME) as sum_time"
						+ " from hairshop_hair_info hhi join mem_designer_rsv_info mdri" + " on(mdri.hhi_no = hhi.hhi_no)"
						+ " group by mdri.mdr_no) c" 
					+ " on (mdr.mdr_no = c.mdr_no)" 
					+ " where mdr.mdr_status != 'i1'"
					+ " and mdr.hs_no = ?"
					+ " and mdr.mdr_date between to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')+1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hsNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
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
				map.put("sum_time", rs.getString("sum_time"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return list;
	}
	
	//예약상세정보 미용실 and 디자이너용 미용실 상세정보
	public MembersReservationVo selectReservationDetailInfo(String mdrNo) {
		MembersReservationVo resultVo = new MembersReservationVo();

		try {
			conn = ConnectionManager.getConnnect();
			String sql = "select  m.mem_no, m.mem_name, m.mem_hair_length, m.mem_hair_status, m.mem_phone, m.mem_sex,"
					+" mdr.mdr_no, mdr.mdr_date, mdr.designer_no, d.designer_name, mdr.mdr_status, mdr.mdr_request"
					+" from members m join members_designer_rsv mdr"
					+" on(mdr.mem_no = m.mem_no)"
					+" join designer d"
					+" on(mdr.designer_no = d.designer_no)"
					+" where mdr.mdr_no = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdrNo); // ?의 첫번째 자리에 올 값 지정
			rs = pstmt.executeQuery();
			System.out.println(sql);
			if (rs.next()) {
				resultVo.setMem_no(rs.getString("mem_no"));
				resultVo.setMem_name(rs.getString("mem_name"));
				resultVo.setMem_hair_length(rs.getString("mem_hair_length"));
				resultVo.setMem_hair_status(rs.getString("mem_hair_status"));
				resultVo.setMem_phone(rs.getString("mem_phone"));
				resultVo.setMem_sex(rs.getString("mem_sex"));
				resultVo.setMdr_no(rs.getString("mdr_no"));
				resultVo.setMdr_date(rs.getString("mdr_date"));
				resultVo.setDesigner_no(rs.getString("designer_no"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				resultVo.setMdr_status(rs.getString("mdr_status"));
				resultVo.setMdr_request(rs.getString("mdr_request"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo; // 값을 리턴해줌
	}

}
