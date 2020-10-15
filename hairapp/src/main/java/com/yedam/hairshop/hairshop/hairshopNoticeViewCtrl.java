package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopNoticeVo;

public class hairshopNoticeViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("공지사항 보기");

		//String admin = request.getSession().getAttribute("admin").toString();

		// 파라미터
		HairshopNoticeVo vo = new HairshopNoticeVo();
		String noticeNo = request.getParameter("notice_no");
		String noticeHit = request.getParameter("notice_hit");
		System.out.println();
		System.out.println("noticeNo: " + noticeNo);
		System.out.println("noticeHit: " + noticeHit);
		vo.setNotice_no(noticeNo);
		// vo.setNotice_no(noticeHit);

		// DB 조회
		HairshopNoticeVo resultVo = HairshopDAO.getInstance().noticeView(vo);
		int hitup = HairshopDAO.getInstance().upHit(vo);
		System.out.println("notice vo 나와라: " + vo);
		System.out.println("hitup: " + hitup);

		// 결과 저장
		request.getSession().setAttribute("view", resultVo);
		request.getSession().setAttribute("viewNo", resultVo.getNotice_no());
		request.getSession().setAttribute("hit", hitup);
		//request.getSession().setAttribute("admin", admin);


		request.getRequestDispatcher("hairshopNoticeView.jsp").forward(request, response);

	}

}
