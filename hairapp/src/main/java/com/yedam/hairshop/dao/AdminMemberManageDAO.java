package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.BoardManageVo;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class AdminMemberManageDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static AdminMemberManageDAO instance = null;
	static String hs = "select * FROM hairshop\n";
	static String hs_no = "WHERE  hs_no like '%'||?||'%' ";
	static String hs_name = "WHERE  hs_name like '%'||?||'%' ";
	static String hs_owner = "WHERE  hs_owner like '%'||?||'%' ";
	static String mem = "select * FROM members\n";
	static String mem_no = "WHERE  mem_no like '%'||?||'%' ";
	static String mem_name = "WHERE  mem_name like '%'||?||'%' ";
	static String mem_email = "WHERE  mem_email like '%'||?||'%' ";
	static String mem_phone = "WHERE  mem_phone like '%'||?||'%' ";
	static String ds = "SELECT DESIGNER_NO,DESIGNER_NAME,DESIGNER_PHONE,DESIGNER_EMAIL,DESIGNER_PW,"
			+ " DESIGNER_DAYOFF,WORK_START_TIME,WORK_END_TIME,DESIGNER_ACCESS_STATUS,POSITION,"
			+ " SALARY,INCENTIVE,HIRE_DATE,HS_NO,DESIGNER_PROFILE,FILE_NAME,hs_name"
			+ " from hairshop h join designer d using(hs_no)";
	static String ds_no = "WHERE  designer_no like '%'||?||'%' ";
	static String ds_name = "WHERE  designer_name like '%'||?||'%' ";
	static String ds_email = "WHERE  designer_email like '%'||?||'%' ";
	static String ds_phone = "WHERE  designer_phone like '%'||?||'%' ";
	static String ds_hs_name = "WHERE  hs_name like '%'||?||'%' ";

	public static AdminMemberManageDAO getInstance() {
		if (instance == null)
			instance = new AdminMemberManageDAO();
		return instance;
	}

	public ArrayList<DesignerVo> selectDs(DesignerVo designerVo) {
		ArrayList<DesignerVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(ds);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				DesignerVo designer = new DesignerVo();
				designer.setDesigner_no(rs.getString("DESIGNER_NO"));
				designer.setDesigner_name(rs.getString("DESIGNER_NAME"));
				designer.setDesigner_phone(rs.getString("DESIGNER_PHONE"));
				designer.setDesigner_email(rs.getString("DESIGNER_EMAIL"));
				designer.setDesigner_pw(rs.getString("DESIGNER_PW"));
				designer.setDesigner_dayoff(rs.getString("DESIGNER_DAYOFF"));
				designer.setWork_start_time(rs.getString("WORK_START_TIME"));
				designer.setWork_end_time(rs.getString("WORK_END_TIME"));
				designer.setDesigner_access_status(rs.getString("DESIGNER_ACCESS_STATUS"));
				designer.setPosition(rs.getString("POSITION"));
				designer.setSalary(rs.getString("SALARY"));
				designer.setIncentive(rs.getString("INCENTIVE"));
				designer.setHire_date(rs.getString("HIRE_DATE"));
				designer.setHs_no(rs.getString("HS_NO"));
				designer.setHs_name(rs.getString("HS_Name"));
				designer.setDesigner_profile(rs.getString("DESIGNER_PROFILE"));
				designer.setFile_name(rs.getString("FILE_NAME"));
				list.add(designer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<HairshopVo> findHs(BoardManageVo vo) {
		ArrayList<HairshopVo> list = new ArrayList<>();

		try {
			conn = ConnectionManager.getConnnect();
			if (vo.getSearchInput().equals("")) {
				pstmt = conn.prepareStatement(hs);
				System.out.println("else");
			} else if (vo.getSearchType().equals("hs_no")) {
				pstmt = conn.prepareStatement(hs + hs_no);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("no");

			} else if (vo.getSearchType().equals("hs_name")) {
				pstmt = conn.prepareStatement(hs + hs_name);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("name");

			} else if (vo.getSearchType().equals("hs_owner")) {
				pstmt = conn.prepareStatement(hs + hs_owner);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("owner");
			}

			System.out.println(vo.getSearchInput());
			System.out.println(vo.getSearchType());
			rs = pstmt.executeQuery();
			System.out.println("hssql");
			while (rs.next()) {
				HairshopVo resultVo = new HairshopVo();
				resultVo.setHs_no(rs.getString("HS_NO"));
				resultVo.setHs_name(rs.getString("HS_NAME"));
				resultVo.setHs_owner(rs.getString("HS_OWNER"));
				resultVo.setHs_tel(rs.getString("HS_TEL"));
				resultVo.setHs_email(rs.getString("HS_EMAIL"));
				resultVo.setHs_pw(rs.getString("HS_PW"));
				resultVo.setHs_comp_no(rs.getString("HS_COMP_NO"));
				resultVo.setHs_profile(rs.getString("HS_PROFILE"));
				resultVo.setHs_notice(rs.getString("HS_NOTICE"));
				resultVo.setHs_fulladdr(rs.getString("HS_FULLADDR"));
				resultVo.setHs_cityaddr(rs.getString("HS_CITYADDR"));
				resultVo.setHs_townaddr(rs.getString("HS_TOWNADDR"));
				resultVo.setHs_streetaddr(rs.getString("HS_STREETADDR"));
				resultVo.setHs_latlong(rs.getString("HS_LATLONG"));
				resultVo.setHs_dayoff(rs.getString("HS_DAYOFF"));
				resultVo.setHs_starttime(rs.getString("HS_STARTTIME"));
				resultVo.setHs_endtime(rs.getString("HS_ENDTIME"));
				resultVo.setHs_resource_option(rs.getString("HS_RESOURCE_OPTION"));
				resultVo.setHs_parking(rs.getString("HS_PARKING"));
				resultVo.setHs_etc(rs.getString("HS_ETC"));

				resultVo.setHs_regdate(rs.getString("HS_REGDATE"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public List<MembersVo> findMem(BoardManageVo vo) {
		ArrayList<MembersVo> list = new ArrayList<>();

		try {
			conn = ConnectionManager.getConnnect();
			if (vo.getSearchInput().equals("")) {
				pstmt = conn.prepareStatement(mem);
				System.out.println("else");
			} else if (vo.getSearchType().equals("mem_no")) {
				pstmt = conn.prepareStatement(mem + mem_no);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("no");

			} else if (vo.getSearchType().equals("mem_name")) {
				pstmt = conn.prepareStatement(mem + mem_name);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("name");

			} else if (vo.getSearchType().equals("mem_email")) {
				pstmt = conn.prepareStatement(mem + mem_email);
				pstmt.setString(1, vo.getSearchInput());
			} else if (vo.getSearchType().equals("mem_phone")) {
				pstmt = conn.prepareStatement(mem + mem_phone);
				pstmt.setString(1, vo.getSearchInput());
			}

			System.out.println(vo.getSearchInput());
			rs = pstmt.executeQuery();
			System.out.println("memsql");
			while (rs.next()) {
				MembersVo members = new MembersVo();
				members.setMem_no(rs.getString(1));
				members.setMem_email(rs.getString(2));
				members.setMem_pw(rs.getString(3));
				members.setMem_name(rs.getString(4));
				members.setMem_phone(rs.getString(5));
				members.setMem_birth(rs.getString(6));
				members.setMem_sex(rs.getString(7));
				members.setMem_addr(rs.getString(8));
				members.setMem_city(rs.getString(9));
				members.setMem_country(rs.getString(10));
				members.setMem_township(rs.getString(11));
				members.setMem_latitude_longitude(rs.getString(12));
				members.setMem_saved_money(rs.getString(13));
				members.setMem_city_latitude_longitude(rs.getString(14));
				members.setMem_hair_length(rs.getString(15));
				members.setMem_hair_status(rs.getString(16));
				members.setMem_zip(rs.getString(17));
				members.setMem_access_status(rs.getString(18));
				list.add(members); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public List<DesignerVo> findDs(BoardManageVo vo) {
		ArrayList<DesignerVo> list = new ArrayList<>();

		try {
			conn = ConnectionManager.getConnnect();
			if (vo.getSearchInput().equals("")) {
				pstmt = conn.prepareStatement(ds);
				System.out.println("else");
			} else if (vo.getSearchType().equals("designer_no")) {
				pstmt = conn.prepareStatement(ds + ds_no);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("no");

			} else if (vo.getSearchType().equals("designer_name")) {
				pstmt = conn.prepareStatement(ds + ds_name);
				pstmt.setString(1, vo.getSearchInput());
				System.out.println("name");

			} else if (vo.getSearchType().equals("designer_email")) {
				pstmt = conn.prepareStatement(ds + ds_email);
				pstmt.setString(1, vo.getSearchInput());
			} else if (vo.getSearchType().equals("designer_phone")) {
				pstmt = conn.prepareStatement(ds + ds_phone);
				pstmt.setString(1, vo.getSearchInput());
			} else if (vo.getSearchType().equals("hs_name")) {
				pstmt = conn.prepareStatement(ds + ds_hs_name);
				pstmt.setString(1, vo.getSearchInput());
			}

			System.out.println(vo.getSearchInput());
			rs = pstmt.executeQuery();
			System.out.println("dssql");

			while (rs.next()) {

				DesignerVo designer = new DesignerVo();
				designer.setDesigner_no(rs.getString("DESIGNER_NO"));
				designer.setDesigner_name(rs.getString("DESIGNER_NAME"));
				designer.setDesigner_phone(rs.getString("DESIGNER_PHONE"));
				designer.setDesigner_email(rs.getString("DESIGNER_EMAIL"));
				designer.setDesigner_pw(rs.getString("DESIGNER_PW"));
				designer.setDesigner_dayoff(rs.getString("DESIGNER_DAYOFF"));
				designer.setWork_start_time(rs.getString("WORK_START_TIME"));
				designer.setWork_end_time(rs.getString("WORK_END_TIME"));
				designer.setDesigner_access_status(rs.getString("DESIGNER_ACCESS_STATUS"));
				designer.setPosition(rs.getString("POSITION"));
				designer.setSalary(rs.getString("SALARY"));
				designer.setIncentive(rs.getString("INCENTIVE"));
				designer.setHire_date(rs.getString("HIRE_DATE"));
				designer.setHs_no(rs.getString("HS_NO"));
				designer.setHs_name(rs.getString("HS_Name"));
				designer.setDesigner_profile(rs.getString("DESIGNER_PROFILE"));
				designer.setFile_name(rs.getString("FILE_NAME"));
				list.add(designer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

}
