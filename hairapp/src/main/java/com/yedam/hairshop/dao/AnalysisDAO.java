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
	static String day = "between to_date(?)-1 and to_date(?)-1";
	static String week = "between to_date(?)-7 and to_date(?)-7";
	static String month = "between add_months(?,-1) and add_months(?,-1)";
	static String rateprev = "SELECT\n" + "    d.designer_name,d.file_name, d.designer_no, \n" + "    nvl(avg((\n"
			+ "        SELECT\n" + "            avg(hr_rate)\n" + "        FROM\n" + "            hairshop_reviews\n"
			+ "        WHERE\n" + "            mdr_no = r.mdr_no  and mdr_date  between ? and ? \n"
			+ "    )), 0) AS rate,\n" + "    RANK() OVER(\n" + "        ORDER BY\n" + "            nvl(avg((\n"
			+ "        SELECT\n" + "         avg(hr_rate)\n" + "        FROM\n" + "            hairshop_reviews\n"
			+ "        WHERE\n" + "            mdr_no = r.mdr_no  and mdr_date  between ? and ? \n"
			+ "    )), 0) DESC\n" + "    ) AS rank\n" + "  ,  nvl(avg((\n" + "        SELECT\n"
			+ "            avg(hr_rate)\n" + "        FROM\n" + "            hairshop_reviews\n" + "        WHERE\n"
			+ "            mdr_no = r.mdr_no  and mdr_date  " + month + "    )), 0) AS prevrate,\n"
			+ "    RANK() OVER(\n" + "        ORDER BY\n" + "            nvl(avg((\n" + "        SELECT\n"
			+ "         avg(hr_rate)\n" + "        FROM\n" + "            hairshop_reviews\n" + "        WHERE\n"
			+ "            mdr_no = r.mdr_no  and mdr_date  " + month + "    )), 0) DESC\n" + "    ) AS prevrank\n"
			+ "FROM\n" + "    members_designer_rsv   r\n"
			+ "    JOIN designer               d ON ( r.designer_no = d.designer_no )\n"
			+ "    LEFT OUTER JOIN designers_leave_info l ON(r.designer_no = l.designer_no)\r\n" + "    WHERE \r\n"
			+ "    r.hs_no = ? \r\n" + "    AND  r. mdr_date > l.DLI_LEAVE_DATE and d.hs_no is not null\r\n"
			+ "    or l.DLI_LEAVE_DATE is null " + "GROUP BY\n" + "    d.designer_name,d.file_name, d.designer_no";
	static String salesprev = "SELECT\n" + "    d.designer_name, d.designer_no, d.file_name ,\n" + "    SUM((\n"
			+ "        SELECT\n" + "            nvl(SUM(mdp_price), 0)\n" + "        FROM\n"
			+ "            members_detail_paylist\n" + "        WHERE\n"
			+ "            mdr_no = r.mdr_no and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \n"
			+ "    )) AS sales,\n" + "    RANK() OVER(\n" + "        ORDER BY\n" + "            SUM((\n"
			+ "                SELECT\n" + "                    nvl(SUM(mdp_price), 0)\n" + "                FROM\n"
			+ "                    members_detail_paylist\n" + "                WHERE\n"
			+ "                    mdr_no = r.mdr_no and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \n"
			+ "            )) DESC\n" + "    ) AS rank\n" + " ,   SUM((\n" + "        SELECT\n"
			+ "            nvl(SUM(mdp_price), 0)\n" + "        FROM\n" + "            members_detail_paylist\n"
			+ "        WHERE\n" + "            mdr_no = r.mdr_no\n" + "and mdr_date  " + month
			+ "    )) AS prevsales,\n" + "    RANK() OVER(\n" + "        ORDER BY\n" + "            SUM((\n"
			+ "                SELECT\n" + "                    nvl(SUM(mdp_price), 0)\n" + "                FROM\n"
			+ "                    members_detail_paylist\n" + "                WHERE\n"
			+ "                    mdr_no = r.mdr_no and mdr_date  " + month + " )) DESC\n" + "    ) AS prevrank\n"
			+ "FROM\n" + "    members_designer_rsv   r\n"
			+ "    JOIN designer               d ON ( r.designer_no = d.designer_no )\n"
			+ "     LEFT OUTER JOIN designers_leave_info l ON(r.designer_no = l.designer_no)\r\n" + "    WHERE \r\n"
			+ "    r.hs_no = ? \r\n" + "    AND  r. mdr_date > l.DLI_LEAVE_DATE and d.hs_no is not null \r\n"
			+ "    or l.DLI_LEAVE_DATE is null \n" + "GROUP BY\n" + "    d.designer_name, d.designer_no, d.file_name";

	static AnalysisDAO instance = null;

	public static AnalysisDAO getInstance() {
		if (instance == null)
			instance = new AnalysisDAO();
		return instance;
	}

	public ArrayList<AnalysisVo> designerRateRank(AnalysisVo vo) {
		ResultSet rs = null;

		String sql = "SELECT\n" + "    d.designer_name,d.file_name, d.designer_no, \n" + "    round(nvl(avg((\n"
				+ "        SELECT\n" + "            avg(hr_rate)\n" + "        FROM\n"
				+ "            hairshop_reviews\n" + "        WHERE\n"
				+ "            mdr_no = r.mdr_no  and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =?  \n"
				+ "    )), 0)) AS rate,\n" + "    RANK() OVER(\n" + "        ORDER BY\n"
				+ "           round( nvl(avg((\n" + "        SELECT\n" + "         avg(hr_rate)\n" + "        FROM\n"
				+ "            hairshop_reviews\n" + "        WHERE\n"
				+ "            mdr_no = r.mdr_no   and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =?  \n"
				+ "    )), 0) )DESC\n" + "    ) AS rank\n" + "FROM\n" + "    members_designer_rsv   r\n"
				+ "    JOIN designer               d ON ( r.designer_no = d.designer_no )\n"
				+ "    LEFT OUTER JOIN designers_leave_info l ON(r.designer_no = l.designer_no)\r\n" + "    WHERE \r\n"
				+ "    r.hs_no = ? \r\n" + "    AND  r. mdr_date > l.DLI_LEAVE_DATE and d.hs_no is not null\r\n"
				+ "    or l.DLI_LEAVE_DATE is null " + "GROUP BY\n" + "    d.designer_name,d.file_name, d.designer_no";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMonth());
			pstmt.setString(2, vo.getMonth());

			pstmt.setString(3, vo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				// resultVo.setPrevrank(rs.getString("prevrank"));
				resultVo.setRate(rs.getString("rate"));
				// resultVo.setPrevrate(rs.getString("prevrate"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setDesigner_no(rs.getString("designer_no"));
				System.out.println("vo" + resultVo.getCnt());
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> designerSalesRank(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT\n" + "    d.designer_name, d.designer_no, d.file_name ,\n" + "    SUM((\n"
				+ "        SELECT\n" + "            nvl(SUM(mdp_price), 0)\n" + "        FROM\n"
				+ "            members_detail_paylist\n" + "        WHERE\n"
				+ "            mdr_no = r.mdr_no and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \n"
				+ "    )) AS sales,\n" + "    RANK() OVER(\n" + "        ORDER BY\n" + "            SUM((\n"
				+ "                SELECT\n" + "                    nvl(SUM(mdp_price), 0)\n" + "                FROM\n"
				+ "                    members_detail_paylist\n" + "                WHERE\n"
				+ "                    mdr_no = r.mdr_no and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =? \n"
				+ "            )) DESC\n" + "    ) AS rank\n" + "FROM\n" + "    members_designer_rsv   r\n"
				+ "    JOIN designer               d ON ( r.designer_no = d.designer_no )\n"
				+ "     LEFT OUTER JOIN designers_leave_info l ON(r.designer_no = l.designer_no)\r\n" + "    WHERE \r\n"
				+ "    r.hs_no = ? \r\n" + "    AND  r. mdr_date > l.DLI_LEAVE_DATE and d.hs_no is not null \r\n"
				+ "    or l.DLI_LEAVE_DATE is null \n" + "GROUP BY\n"
				+ "    d.designer_name, d.designer_no, d.file_name";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMonth());
			pstmt.setString(2, vo.getMonth());

			pstmt.setString(3, vo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				resultVo.setSales(rs.getString("sales"));
				// resultVo.setPrevsales(rs.getString("prevsales"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				// resultVo.setPrevrank(rs.getString("prevrank"));
				resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setDesigner_no(rs.getString("designer_no"));
				System.out.println("vo" + resultVo.getCnt());
				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public ArrayList<AnalysisVo> designerRsvRank(AnalysisVo vo) {
		ResultSet rs = null;
		String sql = "SELECT d. designer_name, d.designer_no,  count(*) as rsv, d.file_name ,rank() over (order by count(*) desc) rank\r\n"
				+ "FROM designer d \r\n" + "JOIN members_designer_rsv r ON(r.designer_no = d.designer_no)\r\n" + "\r\n"
				+ "WHERE r.hs_no = ?\r\n and d.hs_no is not null"
				+ " and substr( to_char(r.mdr_date,'yyyy-mm'),0,8)    =?\r\n"
				+ "group by d.designer_name, d.designer_no, d.file_name";

		System.out.println(sql);
		ArrayList<AnalysisVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getDate());
			pstmt.setString(2, vo.getMonth());
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {

				AnalysisVo resultVo = new AnalysisVo();
				resultVo.setRank(rs.getString("rank"));
				resultVo.setRsv(rs.getString("rsv"));
				resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setDesigner_name(rs.getString("designer_name"));
				resultVo.setFile_name(rs.getString("file_name"));
				resultVo.setDesigner_no(rs.getString("designer_no"));
				System.out.println("vo" + resultVo.getCnt());
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
				+ "    mdr_date BETWEEN add_months(to_date(?,'yyyy-mm'),-6) AND last_day(TO_DATE(?, 'yyyy-mm'))\n"
				+ "GROUP BY\n" + "    to_char(mdr_date, 'yy-mm')";

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
				System.out.println("vo" + resultVo.getCnt());
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

	public ArrayList<AnalysisVo> designerChart(String designer_no) {
		ArrayList<AnalysisVo> list = new ArrayList<>();
		String sql = "SELECT\n" + "    SUM(p.mdp_price) as sales,\n" + "   COUNT(*) as rsv,\n" + "    CASE\n"
				+ "        WHEN to_char(mdr_date,'yy-mm-dd') = to_char(sysdate,'yy-mm-dd') THEN\n"
				+ "            '오늘'\n"
				+ "        WHEN to_char(mdr_date,'yy-mm-dd') = to_char(sysdate-1,'yy-mm-dd')       THEN\n"
				+ "            '어제'\n"
				+ "            WHEN to_char(mdr_date,'yy-mm-dd') = to_char(sysdate+1,'yy-mm-dd')      THEN\n"
				+ "            '내일'\n" + "            end as day\n" + "FROM\n" + " designer d\n" + "   JOIN \n"
				+ "    members_designer_rsv    \n" + "   r ON ( d.designer_no = r.designer_no )\n"
				+ "   JOIN members_detail_paylist   p ON ( r.mdr_no = p.mdr_no )\n" + "WHERE\n"
				+ "    d.designer_no = ?\n"
				+ "    AND mdr_date BETWEEN to_char(sysdate-1,'yy-mm-dd')  AND to_char(sysdate+1,'yy-mm-dd') \n"
				+ "    AND mdr_status IN (\n" + "        'i2',\n" + "        'i3',\n" + "        'i4'\n" + "    )\n"
				+ "GROUP BY\n" +

				" r.mdr_date, "

				+ "    (CASE\n" + "        WHEN to_char(mdr_date,'yy-mm-dd') = to_char(sysdate,'yy-mm-dd') THEN\n"
				+ "            '오늘'\n"
				+ "        WHEN to_char(mdr_date,'yy-mm-dd') = to_char(sysdate-1,'yy-mm-dd')       THEN\n"
				+ "            '어제'\n"
				+ "            WHEN to_char(mdr_date,'yy-mm-dd') = to_char(sysdate+1,'yy-mm-dd')      THEN\n"
				+ "            '내일'\n" + "            end )\n"

				+ "ORDER BY\n" + "    mdr_date";

		ResultSet rs = null;

		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, designer_no);

			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {

				AnalysisVo vo = new AnalysisVo();
				vo.setDate(rs.getString("day"));
				vo.setRsv(rs.getString("rsv"));
				vo.setSales(rs.getString("sales"));
				list.add(vo);

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
		String sql = "SELECT\n" + "    h.hhi_name,\n" + "    tmac.tmac_name,\n" + "    tmic.tmic_explication,\n"
				+ "    m.mem_sex,\n" + "    d.designer_name,\n" + "    AVG(rv.hr_rate) as hr_rate,\n"
				+ "    COUNT(*) as cnt,\n" + "    ROW_NUMBER() OVER(\n" + "        PARTITION BY mem_sex\n"
				+ "        ORDER BY\n" + "            COUNT(*) DESC\n" + "    ) rank\n" + "FROM\n"
				+ "    hairshop_hair_info      h\n" + "    JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )\n"
				+ "    JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )\n"
				+ "    JOIN members                 m ON ( r.mem_no = m.mem_no )\n"
				+ "    JOIN tt_middle_category      tmic ON ( tmic.tmic_no = h.tmic_no )\n"
				+ "    JOIN tt_main_category        tmac ON ( tmac.tmac_no = tmic.tmac_no )\n" + "    JOIN (\n"
				+ "        SELECT\n" + "            a.hhi_name,\n" + "            a.designer_name\n" + "        FROM\n"
				+ "            (\n" + "                SELECT\n" + "                    d.designer_name,\n"
				+ "                    h.hhi_name,\n" + "                    COUNT(*) ,\n"
				+ "                    ROW_NUMBER() OVER(\n" + "                        PARTITION BY h.hhi_name\n"
				+ "                        ORDER BY\n" + "                            COUNT(*) DESC\n"
				+ "                    ) ranking\n" + "                FROM\n"
				+ "                    hairshop_hair_info      h\n"
				+ "                    JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )\n"
				+ "                    JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )\n"
				+ "                    JOIN designer                d ON ( d.designer_no = r.designer_no )\n"
				+ "                GROUP BY\n" + "                    h.hhi_name,\n"
				+ "                    d.designer_name\n" + "            ) a\n" + "        WHERE\n"
				+ "            a.ranking < 2\n" + "    ) d ON ( d.hhi_name = h.hhi_name )\n"
				+ "    LEFT OUTER JOIN hairshop_reviews        rv ON ( rv.mdr_no = r.mdr_no )\n" + "WHERE\n"
				+ "    r.hs_no = ?\n AND r.mdr_date BETWEEN ? AND last_day(TO_DATE(?, 'yyyy-mm-dd'))" + "GROUP BY\n"
				+ "    h.hhi_name,\n" + "    tmac.tmac_name,\n" + "    tmic.tmic_explication,\n" + "    m.mem_sex,\n"
				+ "    d.designer_name,\n" + "    rv.hr_rate";
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

	public ArrayList<AnalysisVo> treatRankMale(ArrayList<AnalysisVo> list) {
		ResultSet rs = null;
		String sql = "select h.hhi_name ,count(*) as cnt ,row_number() over (order by count(*) desc) rank\n"
				+ "    from hairshop_hair_info h \n" + "    join mem_designer_rsv_info i on(h.hhi_no = i.hhi_no) \n"
				+ "    join members_designer_rsv r  on(r.mdr_no=i.mdr_no)\n"
				+ "  join members m on(r.mem_no=m.mem_no)\n" + "    where m.mem_sex= 'male'"
				+ "    group by h.hhi_name";
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getDate() + "-01");

			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				for (AnalysisVo vo : list) {
					if (vo.getRank().equals(rs.getString("rank"))) {

						vo.setCntMale(rs.getString("cnt"));
						vo.setHhi_nameMale(rs.getString("hhi_name"));
					}
				}
//				AnalysisVo resultVo = new AnalysisVo();
//				resultVo.setRank(rs.getString("rank"));
				// resultvo.setGender("male");
				// list.add(resultVo);
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
		String sql = "select a.* from ( select h.hhi_name ,count(*) as cnt ,row_number() over (order by count(*) desc) rank\n"
				+ "    from hairshop_hair_info h \n" + "    join mem_designer_rsv_info i on(h.hhi_no = i.hhi_no) \n"
				+ "    join members_designer_rsv r  on(r.mdr_no=i.mdr_no)\n"
				+ "  join members m on(r.mem_no=m.mem_no)\n" + "    where m.mem_sex= 'female'"
				+ "    group by h.hhi_name ) a  where a.rank<6";
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

	// 일별 기간
	public ArrayList<AnalysisVo> getDayList(AnalysisVo vo) {
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		String sql = "SELECT sum(mdp_price) sales, d FROM (\n"
				+ "    SELECT mdp.mdp_price, TO_CHAR(mdr.mdr_date, 'yyyy-mm-dd') d\n"
				+ "    FROM members_detail_paylist mdp, \n" + "         members_designer_rsv mdr\n"
				+ "    WHERE hs_no=?)\n" + "GROUP BY d";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
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
		if (list == null || list.size() == 0) {
			System.out.println("getDayList is null or zero query");
		}
		return list;
	}

	// 월별 기간
	public ArrayList<AnalysisVo> getMonthList(AnalysisVo vo) {
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		String sql = "SELECT sum(mdp_price) sales, d FROM (\n"
				+ "    SELECT mdp.mdp_price, TO_CHAR(mdr.mdr_date, 'yyyy-mm') d\n"
				+ "    FROM members_detail_paylist mdp, \n" + "         members_designer_rsv mdr\n"
				+ "    WHERE hs_no=?)\n" + "GROUP BY d";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
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

	// 연도별 기간
	public ArrayList<AnalysisVo> getYearList(AnalysisVo vo) {
		ArrayList<AnalysisVo> list = new ArrayList<AnalysisVo>();
		ResultSet rs = null;
		String sql = "SELECT sum(mdp_price) sales, d FROM (\n"
				+ "    SELECT mdp.mdp_price, TO_CHAR(mdr.mdr_date, 'yyyy') d\n"
				+ "    FROM members_detail_paylist mdp, \n" + "         members_designer_rsv mdr\n"
				+ "    WHERE hs_no=?)\n" + "GROUP BY d";
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getHs_no());
			rs = pstmt.executeQuery();
			while (rs.next()) {
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
