package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.Paging;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class MembersNoticeCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersNoticeCtrl");

		// 파라미터
		String p = request.getParameter("p");
		
		if(request.getSession().getAttribute("loginid").toString() != null) {
		String admin = request.getSession().getAttribute("admin").toString();
		request.getSession().setAttribute("admin", admin);
		}

		// 유효성 체크
		int page = 1;
		if (p != null) {
			page = Integer.parseInt(p); // p가 널이 아니라면 p를 인트로 변환후 page에 담기
		}
		Paging paging = new Paging();
		paging.setPageUnit(10); // 한페이지에 출력할 레코드 건수 설정
		paging.setPageSize(10); // 페이지 번호 수 설정
		
		paging.setPage(page); // paging 반영되게 해주기
		

		// 파라미터 VO에 담기
		HairshopNoticeVo vo = new HairshopNoticeVo();
		NoticeDAO dao = new NoticeDAO();
		
		paging.setTotalRecord(dao.count(vo)); // dao.count() 쓰면 first,last paging에서 알아서 계산다해주고 카운트에도 넘김
		vo.setFirst(paging.getFirst()); // first를 dept에 담음
		vo.setLast(paging.getLast()); // last를 dept에 담음
		// http://localhost/web1/dept/deptSelectAll?p=1 주소형식에서 p=에 페이지 숫자 넣으면 다음페이지로
		// 넘어가는거 확인될거임

		// DB 조회
		ArrayList<HairshopNoticeVo> list = dao.selectPaging(vo);

		// 결과 저장
		request.setAttribute("write", list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/members/membersNotice.jsp").forward(request, response);

	}

}
