package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.BoardSettingVo;

public class BoardSettingDAO {
	static Connection conn;
	PreparedStatement pstmt;
	ResultSet rs = null;

	static BoardSettingDAO instance = null;

	final static String noticeTotal = "select count(*) from notice where notice_who=?";
	final static String noticeNew = "select  count(*) from notice where notice_who= ? and "
			+ "to_date(notice_writedate,'yy-mm-dd') =to_date(sysdate, 'yy-mm-dd')";
	final static String qnaTotal = "select count(*) from qna where qna_who like'%'||?||'%'";
	final static String qnaNew = "select  count(*) from qna where qna_who like '%'||?||'%' and "
			+ "to_date(qna_writedate,'yy-mm-dd') =to_date(sysdate, 'yy-mm-dd')";

	public static BoardSettingDAO getInstance() {
		if (instance == null)
			instance = new BoardSettingDAO();
		return instance;
	}

	public Integer countNew(BoardSettingVo vo) {
		int n = 0;
		String sql = "";
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getType().equals("공지사항")) {
				sql = noticeNew;
			} else {
				sql = qnaNew;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWho());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				n = rs.getInt(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return n;
	}

	public Integer countTotal(BoardSettingVo vo) {
		int n = 0;
		String sql = "";
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getType().equals("공지사항")) {
				sql = noticeTotal;
			} else {
				sql = qnaTotal;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWho());
			rs = pstmt.executeQuery();
			System.out.println("nnsql");
			while (rs.next()) {
				n = rs.getInt(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return n;
	}
}