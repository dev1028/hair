package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.BoardSettingVo;

public class BoardSettingDAO {
	static Connection conn;
	PreparedStatement pstmt;

	static BoardSettingDAO instance = null;

	final static String noticeTotal = "select count(*) from notice where notice_who=?";
	final static String noticeNew = "select  count(*) from notice where notice_who= ? and "
			+ "to_date(notice_writedate,'yy-mm-dd') =to_date(sysdate, 'yy-mm-dd')";
	final static String qnaTotal = "select count(*) from qna where qna_who like'%'||?||'%'";
	final static String qnaNew = "select  count(*) from qna where qna_who like '%'||?||'%' and "
			+ "to_date(qna_writedate,'yy-mm-dd') =to_date(sysdate, 'yy-mm-dd')";

	final static String selectAll = "select BOARD_ID,BOARD_TYPE,BOARD_WHO,BOARD_READABLE,BOARD_WRITTABLE ,  (select c.code_info     \n" + 
			"            from code c  \n" + 
			"            where c.secondary_code=b.board_who) \"board_whov\" \n" + 
			"from board b";

	public static BoardSettingDAO getInstance() {
		if (instance == null)
			instance = new BoardSettingDAO();
		return instance;
	}

	public ArrayList<BoardSettingVo> selectAll() {
		ResultSet rs = null;
		ArrayList<BoardSettingVo> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(selectAll);
			rs = pstmt.executeQuery();
			System.out.println("nnsql");

			while (rs.next()) {
				BoardSettingVo vo = new BoardSettingVo();
				vo.setBoard_id(rs.getString("board_id"));
				vo.setBoard_type(rs.getString("board_type"));
				vo.setBoard_readable(rs.getString("board_readable"));
				vo.setBoard_writtable(rs.getString("board_writtable"));
				vo.setBoard_who(rs.getString("board_who"));
				vo.setBoard_whov(rs.getString("board_whov"));
				list.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;
	}

	public Integer countNew(BoardSettingVo vo) {
		ResultSet rs = null;
		int n = 0;
		String sql = "";
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getBoard_type().equals("notice")) {
				sql = noticeNew;
			} else {
				sql = qnaNew;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBoard_who());
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
		ResultSet rs = null;
		int n = 0;
		String sql = "";
		try {
			conn = ConnectionManager.getConnnect();

			if (vo.getBoard_type().equals("notice")) {
				sql = noticeTotal;
			} else {
				sql = qnaTotal;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBoard_who());
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