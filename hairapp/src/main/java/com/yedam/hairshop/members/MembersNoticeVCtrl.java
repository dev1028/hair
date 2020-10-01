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
		HairshopNoticeVo vo = new HairshopNoticeVo();
		String noticeNo = request.getParameter("notice_no");
		String noticeHit = request.getParameter("notice_hit");
		System.out.println();
		System.out.println("noticeNo: " + noticeNo);
		System.out.println("noticeHit: " + noticeHit);
		vo.setNotice_no(noticeNo);
		//vo.setNotice_no(noticeHit);

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
