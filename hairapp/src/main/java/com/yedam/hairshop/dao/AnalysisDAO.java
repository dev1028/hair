package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.AnalysisVo;

public class AnalysisDAO {

	static Connection conn;
	PreparedStatement pstmt;

	static AnalysisDAO instance = null;

	public static AnalysisDAO getInstance() {
		if (instance == null)
			instance = new AnalysisDAO();
		return instance;
	}

	
	
	public ArrayList<AnalysisVo> designerRsvRank(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT d. designer_name, count(*) as cnt ,rank() over (order by count(*) desc) rank\r\n" + 
				"FROM designer d \r\n" + 
				"JOIN members_designer_rsv r ON(r.designer_no = d.designer_no)\r\n" + 
				"\r\n" + 
				"WHERE r.hs_no = ?\r\n" + 
				"\r\n" + 
				"group by d.designer_name";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getDate());
//			pstmt.setString(2, vo.getDate());
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
System.out.println("vo"+resultVo.getCnt());
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<AnalysisVo> countTotal(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT\n" + "    to_char(mdr_date, 'yy-mm') AS dat , \n" + "    COUNT(mdr_date) AS cnt\n"
				+ "FROM\n" + "    members_designer_rsv\n" + "WHERE\n"
				+ "    mdr_date BETWEEN add_months(to_date(?,'yyyy-mm'),-6) AND last_day(TO_DATE(?, 'yyyy-mm'))\n" + "GROUP BY\n"
				+ "    to_char(mdr_date, 'yy-mm')";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate());
			pstmt.setString(2, vo.getDate());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setDate(rs.getString("dat"));
				resultVo.setCnt(rs.getString("cnt"));
System.out.println("vo"+resultVo.getCnt());
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> countAgeByMale(AnalysisVo vo) {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<>();
		String sql = " SELECT\n" + "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1) AS age,\n"
				+ "    COUNT(m.mem_birth) AS cnt\n" + "FROM\n" + "    members_designer_rsv   r\n"
				+ "    JOIN members                m USING ( mem_no )\n" + "WHERE\n" + "    m.mem_sex = 'male'\n"
				+ "    AND mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))\n"
				+ "        AND mem_birth IS NOT NULL\n" + "GROUP BY\n"
				+ "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1)";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate() + "-01");
			pstmt.setString(2, vo.getDate() + "-01");
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setAge(rs.getString("age"));
				resultVo.setAge_cnt(rs.getString("cnt"));
				vo.setGender("male");
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<AnalysisVo> treatRank(AnalysisVo vo) {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<>();
		String sql = "SELECT\n" + 
				"    h.hhi_name,\n" + 
				"    tmac.tmac_name,\n" + 
				"    tmic.tmic_explication,\n" + 
				"    m.mem_sex,\n" + 
				"    d.designer_name,\n" + 
				"    AVG(rv.hr_rate) as hr_rate,\n" + 
				"    COUNT(*) as cnt,\n" + 
				"    ROW_NUMBER() OVER(\n" + 
				"        PARTITION BY mem_sex\n" + 
				"        ORDER BY\n" + 
				"            COUNT(*) DESC\n" + 
				"    ) rank\n" + 
				"FROM\n" + 
				"    hairshop_hair_info      h\n" + 
				"    JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )\n" + 
				"    JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )\n" + 
				"    JOIN members                 m ON ( r.mem_no = m.mem_no )\n" + 
				"    JOIN tt_middle_category      tmic ON ( tmic.tmic_no = h.tmic_no )\n" + 
				"    JOIN tt_main_category        tmac ON ( tmac.tmac_no = tmic.tmac_no )\n" + 
				"    JOIN (\n" + 
				"        SELECT\n" + 
				"            a.hhi_name,\n" + 
				"            a.designer_name\n" + 
				"        FROM\n" + 
				"            (\n" + 
				"                SELECT\n" + 
				"                    d.designer_name,\n" + 
				"                    h.hhi_name,\n" + 
				"                    COUNT(*) ,\n" + 
				"                    ROW_NUMBER() OVER(\n" + 
				"                        PARTITION BY h.hhi_name\n" + 
				"                        ORDER BY\n" + 
				"                            COUNT(*) DESC\n" + 
				"                    ) ranking\n" + 
				"                FROM\n" + 
				"                    hairshop_hair_info      h\n" + 
				"                    JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )\n" + 
				"                    JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )\n" + 
				"                    JOIN designer                d ON ( d.designer_no = r.designer_no )\n" + 
				"                GROUP BY\n" + 
				"                    h.hhi_name,\n" + 
				"                    d.designer_name\n" + 
				"            ) a\n" + 
				"        WHERE\n" + 
				"            a.ranking < 2\n" + 
				"    ) d ON ( d.hhi_name = h.hhi_name )\n" + 
				"    LEFT OUTER JOIN hairshop_reviews        rv ON ( rv.mdr_no = r.mdr_no )\n" + 
				"WHERE\n" + 
				"    r.hs_no = ?\n AND r.mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))" + 
				"GROUP BY\n" + 
				"    h.hhi_name,\n" + 
				"    tmac.tmac_name,\n" + 
				"    tmic.tmic_explication,\n" + 
				"    m.mem_sex,\n" + 
				"    d.designer_name,\n" + 
				"    rv.hr_rate";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getHs_no());
		pstmt.setString(2, vo.getDate() + "-01");
		pstmt.setString(3, vo.getDate() + "-01");
		
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setHhi_name(rs.getString("hhi_name"));
				resultVo.setRank(rs.getString("rank"));
				resultVo.setGender(rs.getString("mem_sex"));
				resultVo.setTmac_name(rs.getString("tmac_name"));
				resultVo.setTmic_name(rs.getString("tmic_explication"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				resultVo.setHr_rate(rs.getString("hr_rate"));
				
				
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<AnalysisVo> treatRankMale(ArrayList<AnalysisVo>  list) {
		ResultSet rs = null;
		String sql = "select h.hhi_name ,count(*) as cnt ,row_number() over (order by count(*) desc) rank\n" + 
				"    from hairshop_hair_info h \n" + 
				"    join mem_designer_rsv_info i on(h.hhi_no = i.hhi_no) \n" + 
				"    join members_designer_rsv r  on(r.mdr_no=i.mdr_no)\n"
				+ "  join members m on(r.mem_no=m.mem_no)\n" + 
				"    where m.mem_sex= 'male'"+ 
				"    group by h.hhi_name";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getDate() + "-01");
		
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				for(AnalysisVo vo : list) {
				if(vo.getRank().equals(rs.getString("rank"))) {
					
					vo.setCntMale(rs.getString("cnt"));
					vo.setHhi_nameMale(rs.getString("hhi_name"));
				}
				}
//				AnalysisVo resultVo = new AnalysisVo();
//				resultVo.setRank(rs.getString("rank"));
				//resultvo.setGender("male");
				//list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	public ArrayList<AnalysisVo> treatRankFemale(AnalysisVo vo) {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<>();
		String sql = "select a.* from ( select h.hhi_name ,count(*) as cnt ,row_number() over (order by count(*) desc) rank\n" + 
				"    from hairshop_hair_info h \n" + 
				"    join mem_designer_rsv_info i on(h.hhi_no = i.hhi_no) \n" + 
				"    join members_designer_rsv r  on(r.mdr_no=i.mdr_no)\n"
				+ "  join members m on(r.mem_no=m.mem_no)\n" + 
				"    where m.mem_sex= 'female'"+ 
				"    group by h.hhi_name ) a  where a.rank<6";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getDate() + "-01");
		
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setCnt(rs.getString("cnt"));
				resultVo.setHhi_nameFemale(rs.getString("hhi_name"));
				resultVo.setRank(rs.getString("rank"));
				vo.setGender("female");
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> countAgeByFemale(AnalysisVo vo) {
		ResultSet rs = null;
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		String sql = " SELECT\n" + "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1) AS age,\n"
				+ "    COUNT(m.mem_birth) AS cnt\n" + "FROM\n" + "    members_designer_rsv   r\n"
				+ "    JOIN members                m USING ( mem_no )\n" + "WHERE\n" + "    m.mem_sex = 'female'\n"
				+ "    AND mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))\n"
				+ "        AND mem_birth IS NOT NULL\n" + "GROUP BY\n"
				+ "    trunc((sysdate - to_date(m.mem_birth)) / 365 + 1, - 1)";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate() + "-01");
			pstmt.setString(2, vo.getDate() + "-01");
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setAge(rs.getString("age"));
				resultVo.setAge_cnt(rs.getString("cnt"));
				resultVo.setGender("female");
				list.add(resultVo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> countGender(AnalysisVo vo) {
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		int n = 0;
		String sql = "SELECT\n" + "    m.mem_sex AS gender,\n" + "    COUNT(m.mem_sex) AS cnt\n" + "FROM\n"
				+ "    members_designer_rsv   r\n" + "    JOIN members  m USING ( mem_no )\n" + "WHERE\n"
				+ "    mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))\n" + "    AND mem_sex IS NOT NULL\n"
				+ "GROUP BY\n" + "    m.mem_sex";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getDate() + "-01");
			pstmt.setString(2, vo.getDate() + "-01");
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				AnalysisVo resultVo = new AnalysisVo();

				resultVo.setGender(rs.getString("gender"));
				resultVo.setGender_cnt(rs.getString("cnt"));
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
 
	
	//일별 기간
	public ArrayList<AnalysisVo> getDayList(AnalysisVo vo){
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		String sql = 
				"SELECT sum(mdp_price) sales, d FROM (\n" + 
				"    SELECT mdp.mdp_price, TO_CHAR(mdr.mdr_date, 'yyyy-mm-dd') d\n" + 
				"    FROM members_detail_paylist mdp, \n" + 
				"         members_designer_rsv mdr\n" + 
				"    WHERE hs_no=?)\n" + 
				"GROUP BY d";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AnalysisVo tmpVo = new AnalysisVo();
				tmpVo.setSales(rs.getString("sales"));
				tmpVo.setDate(rs.getString("d"));
				list.add(tmpVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		if(list== null || list.size() == 0) {
			System.out.println("getDayList is null or zero query");
		}
		return list;
	}
	
	//월별 기간
	public ArrayList<AnalysisVo> getMonthList(AnalysisVo vo){
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		String sql = 
				"SELECT sum(mdp_price) sales, d FROM (\n" + 
				"    SELECT mdp.mdp_price, TO_CHAR(mdr.mdr_date, 'yyyy-mm') d\n" + 
				"    FROM members_detail_paylist mdp, \n" + 
				"         members_designer_rsv mdr\n" + 
				"    WHERE hs_no=?)\n" + 
				"GROUP BY d";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AnalysisVo tmpVo = new AnalysisVo();
				tmpVo.setSales(rs.getString("sales"));
				tmpVo.setDate(rs.getString("d"));
				list.add(tmpVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
	
	//연도별 기간
	public ArrayList<AnalysisVo> getYearList(AnalysisVo vo){
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		String sql = 
				"SELECT sum(mdp_price) sales, d FROM (\n" + 
				"    SELECT mdp.mdp_price, TO_CHAR(mdr.mdr_date, 'yyyy') d\n" + 
				"    FROM members_detail_paylist mdp, \n" + 
				"         members_designer_rsv mdr\n" + 
				"    WHERE hs_no=?)\n" + 
				"GROUP BY d";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AnalysisVo tmpVo = new AnalysisVo();
				tmpVo.setSales(rs.getString("sales"));
				tmpVo.setDate(rs.getString("d"));
				list.add(tmpVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}
}
