package com.yedam.hairshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.QnaVo;

public class HairshopQnaDAO {
	// 전역변수
	Connection conn;
	PreparedStatement pstmt;

	// 싱글톤
	static HairshopQnaDAO instance;

	public static HairshopQnaDAO getInstance() {
		if (instance == null)
			instance = new HairshopQnaDAO();
		return instance;
	}

	// 시퀀스를 가져온다.
	public int getSeq() {
		ResultSet rs = null;
		int result = 1;
		try {
			conn = ConnectionManager.getConnnect();

			// 시퀀스 값을 가져온다. (DUAL : 시퀀스 값을 가져오기위한 임시 테이블)
			String sql = "SELECT qna_no_seq.NEXTVAL FROM DUAL";
			pstmt = conn.prepareStatement(sql);

			// 쿼리 실행
			rs = pstmt.executeQuery();

			if (rs.next())
				result = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return result;
	} // end getSeq

	// Qna view
	public QnaVo qnaView(int qna_no) {
		ResultSet rs = null;
		QnaVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT QNA_NO, QNA_SHOP_CUSTOMER_NO, QNA_TITLE, QNA_CONTENTS, QNA_WRITEDATE, QNA_OPENSTATUS,"
					+ " QNA_HITS, QNA_CATEGORY, EMP_NO," + " QNA_REF, QNA_REPOS, QNA_LEVEL, QNA_WRITER" + " FROM QNA "
					+ " WHERE QNA_WHO = 'j1'" + " AND QNA_NO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new QnaVo();
				resultVo.setQna_no(rs.getInt("qna_no"));
				resultVo.setQna_shop_customer_no(rs.getString("qna_shop_customer_no"));
				resultVo.setQna_title(rs.getString("qna_title"));
				resultVo.setQna_contents(rs.getString("qna_contents"));
				resultVo.setQna_writedate(rs.getString("qna_writedate"));
				resultVo.setQna_openstatus(rs.getString("qna_openstatus"));
				resultVo.setQna_hits(rs.getString("qna_hits"));
				resultVo.setQna_category(rs.getString("qna_category"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setQna_ref(rs.getInt("qna_ref"));
				resultVo.setQna_repos(rs.getInt("qna_repos"));
				resultVo.setQna_level(rs.getInt("qna_level"));
				resultVo.setQna_writer(rs.getString("qna_writer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;

	} // end

	// Qna ModifyView
	public QnaVo qnaModifyView(QnaVo qna_no) {
		ResultSet rs = null;
		QnaVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT QNA_NO, QNA_TITLE, QNA_CONTENTS, QNA_WRITEDATE, QNA_OPENSTATUS,"
					+ " QNA_HITS, QNA_CATEGORY, EMP_NO," + " QNA_REF, QNA_REPOS, QNA_LEVEL, QNA_WRITER" + " FROM QNA "
					+ " WHERE QNA_WHO = 'j1'" + " AND QNA_NO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_no.getQna_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new QnaVo();
				resultVo.setQna_no(rs.getInt("qna_no"));
				resultVo.setQna_title(rs.getString("qna_title"));
				resultVo.setQna_contents(rs.getString("qna_contents"));
				resultVo.setQna_writedate(rs.getString("qna_writedate"));
				resultVo.setQna_openstatus(rs.getString("qna_openstatus"));
				resultVo.setQna_hits(rs.getString("qna_hits"));
				resultVo.setQna_category(rs.getString("qna_category"));
				resultVo.setEmp_no(rs.getString("emp_no"));
				resultVo.setQna_ref(rs.getInt("qna_ref"));
				resultVo.setQna_repos(rs.getInt("qna_repos"));
				resultVo.setQna_level(rs.getInt("qna_level"));
				resultVo.setQna_writer(rs.getString("qna_writer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;
	} // end

	// Qna 조회수
	public int upHit(QnaVo qnaVo) {
		ResultSet rs = null;
		int result = 0;
		try {
			conn = ConnectionManager.getConnnect();
			pstmt = conn.prepareStatement("UPDATE qna SET qna_hits = qna_hits + 1" + " WHERE qna_no = ?");
			pstmt.setInt(1, qnaVo.getQna_no());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}

		return result;
	}

	// Qna 작성
	public int qnaInsert(QnaVo qnaVo) {
		ResultSet rs = null;
		int r = 0;
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "INSERT INTO qna(qna_no, qna_shop_customer_no, qna_title, qna_contents,"
					+ " qna_writedate, qna_openstatus, qna_hits, qna_category,"
					+ " qna_who, emp_no, qna_ref, qna_repos, qna_level, qna_writer)"
					+ " VALUES(?, ?, ?, ?, sysdate, ?, 0, ?," + " 'j1', 50, ?, ?, ?, ?)";

			// 시퀀스 값을 글번호와 그룹번호로 사용
			int num = qnaVo.getQna_no();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qnaVo.getQna_shop_customer_no());
			pstmt.setString(3, qnaVo.getQna_title());
			pstmt.setString(4, qnaVo.getQna_contents());
			pstmt.setString(5, qnaVo.getQna_openstatus());
			pstmt.setString(6, qnaVo.getQna_category());
			if (qnaVo.getQna_repos() == 0) // re_seq==0 은 답변글이 없는경우, 즉 부모글일경우
				pstmt.setInt(7, num);
			else
				pstmt.setInt(7, qnaVo.getQna_ref());
			pstmt.setInt(8, qnaVo.getQna_repos());
			pstmt.setInt(9, qnaVo.getQna_level());
			pstmt.setString(10, qnaVo.getQna_writer());

			r = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return r;
	}

	// Qna 전체 조회(페이징)
	public ArrayList<QnaVo> selectPaging(QnaVo qnaVo) { // 조회가 여러건이면 DeptVO를 list에 담음
		ResultSet rs = null;
		QnaVo resultVO = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<QnaVo> list = new ArrayList<QnaVo>(); // 결과값을 저장할 list 변수 객체 선언
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "select a.* from (select rownum rn,b.* from ("
					+ " SELECT QNA_NO, QNA_SHOP_CUSTOMER_NO, QNA_TITLE, QNA_CONTENTS,"
					+ " QNA_WRITEDATE, QNA_OPENSTATUS, QNA_HITS, QNA_CATEGORY,"
					+ " EMP_NO, QNA_REF, QNA_REPOS, QNA_LEVEL, QNA_WRITER" + " FROM QNA" + " where QNA_WHO = 'j1'"
					+ " order by QNA_REF desc, QNA_REPOS asc, QNA_WRITEDATE desc" + " ) b) a where rn between ? and ?";
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			int pos = 1; // 물음표값 동적으로 하려고 변수선언

			pstmt.setInt(pos++, qnaVo.getFirst()); // 물음표부분이 pos++로 인해 동적으로 늘어남
			pstmt.setInt(pos++, qnaVo.getLast());
			rs = pstmt.executeQuery(); // select 시에는 executeQuery() 쓰기

			while (rs.next()) { // 여러건 조회라서 while를 사용. next()로 한건 한건마다 true 인지 false인지 확인하고 이동함
				resultVO = new QnaVo(); // 레코드 한건을 resultVO에 담음
				resultVO.setQna_no(rs.getInt("qna_no"));
				resultVO.setQna_shop_customer_no(rs.getString("qna_shop_customer_no"));
				resultVO.setQna_title(rs.getString("qna_title"));
				resultVO.setQna_contents(rs.getString("qna_contents"));
				resultVO.setQna_writedate(rs.getString("qna_writedate"));
				resultVO.setQna_openstatus(rs.getString("qna_openstatus"));
				resultVO.setQna_hits(rs.getString("qna_hits"));
				resultVO.setQna_category(rs.getString("qna_category"));
				resultVO.setEmp_no(rs.getString("emp_no"));
				resultVO.setQna_ref(rs.getInt("qna_ref"));
				resultVO.setQna_repos(rs.getInt("qna_repos"));
				resultVO.setQna_level(rs.getInt("qna_level"));
				resultVO.setQna_writer(rs.getString("qna_writer"));
				list.add(resultVO); // resultVo를 list에 담음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list; // 값을 리턴해줌
	}

	// Qna 전체 건수
	public int count(QnaVo qnaVo) {
		ResultSet rs = null;
		int cnt = 0;
		try {
			conn = ConnectionManager.getConnnect();

			String sql = "SELECT COUNT(*) FROM QNA" + " WHERE QNA_WHO = 'j1' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}

	public boolean updateRePos(QnaVo qnaVo) {
		boolean result = false;

		int ref = qnaVo.getQna_ref(); // 원본글 번호(그룹번호)
		int repos = qnaVo.getQna_repos(); // 답변글의 순서

		try {
			conn = ConnectionManager.getConnnect();

			// ref(그룹번호)와 repos(답글순서)을 확인하여 원본 글에 다른 답변 글이 있으면,
			// 답변 글 중 답변 글보다 상위에 있는 글의 seq보다 높은 글의 seq값을 1씩 증가시킨다.
			String sql = "update qna set qna_repos = qna_repos+1 " + " where qna_ref = ? and qna_repos > ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, repos);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return result;
	}

	// Qna 수정
	public void noticeModify(QnaVo qnaVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "UPDATE QNA" + " SET QNA_TITLE =?, QNA_CONTENTS=?, QNA_OPENSTATUS=?, QNA_CATEGORY=?"
					+ " WHERE QNA_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qnaVo.getQna_title());
			pstmt.setString(2, qnaVo.getQna_contents());
			pstmt.setString(3, qnaVo.getQna_openstatus());
			pstmt.setString(4, qnaVo.getQna_category());
			pstmt.setInt(5, qnaVo.getQna_no());

			pstmt.executeUpdate(); // 실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	} // end Qna 수정

	// Qna 삭제
	public void qnaDelete(QnaVo qnaVo) {
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "DELETE FROM QNA WHERE QNA_NO=?"; // 값 들어갈 자리에 ? 로 지정
			pstmt = conn.prepareStatement(sql); // 미리 sql 구문이 준비가 되어야한다
			pstmt.setInt(1, qnaVo.getQna_no()); // ?의 첫번째 자리에 올 값 지정
			int r = pstmt.executeUpdate(); // 실행
			System.out.println(r + " 건이 삭제됨"); // 결과 처리

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(null, pstmt, conn); // 연결 해제
		}
	} // Qna 삭제 끝

	// Qna 메인에 띄울거
	public ArrayList<QnaVo> mainQnaList() {
		ResultSet rs = null;
		QnaVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<QnaVo> list = new ArrayList<QnaVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT QNA_TITLE FROM QNA" + " WHERE ROWNUM <=3 AND QNA_WHO = 'j1' AND QNA_WRITER !='관리자'"
					+ " ORDER BY QNA_NO DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new QnaVo();
				resultVo.setQna_title(rs.getString("qna_title"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	} // end

}
