package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.NoticeDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;
import com.yedam.hairshop.model.HairshopVo;

public class MembersNoticeVCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersNoticeVCtrl");
		// 파라미터
		//이거 getParameter가 아니라, getParameters 인가 복수형으로 받아야 할꺼 같은데.
		//근데 이거 뭐하기위한 ctrl임?
		//클릭 했을때 한개만 상세보기말하는거가?
		HairshopNoticeVo vo = new HairshopNoticeVo();
		String noticeNo = request.getParameter("notice_no");
		String[] noticeHit = request.getParameterValues("noticeHit");
		
		System.out.println("noticeNo: " + noticeNo);
		System.out.println("noticeHit: " + noticeHit);
		vo.setNotice_no(noticeNo);
		vo.setNotice_no(noticeHit);

		// DB 조회
		HairshopNoticeVo resultVo = NoticeDAO.getInstance().noticeView(vo);
		int hitup = NoticeDAO.getInstance().upHit(vo);
		System.out.println("hitup: " + hitup);

		// 결과 저장
		request.getSession().setAttribute("view", resultVo);
		request.getSession().setAttribute("hit", hitup);
		//request.setAttribute("view", resultVo);
		
		request.getRequestDispatcher("membersNoticeView.jsp").forward(request, response);

	}

}
