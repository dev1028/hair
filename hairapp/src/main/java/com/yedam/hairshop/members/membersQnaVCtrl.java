package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class membersQnaVCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersQnaVCtrl");

		String admin = request.getSession().getAttribute("admin").toString();
		String loginId = request.getSession().getAttribute("loginid").toString();

		// 파라미터
		QnaVo vo = new QnaVo();
		int qnaNo = Integer.parseInt(request.getParameter("qna_no"));
		String qnaHit = request.getParameter("qna_hit");
		System.out.println();
		System.out.println("qnaNo: " + qnaNo);
		System.out.println("qnaHit: " + qnaHit);
		vo.setQna_no(qnaNo);
		// vo.setQna_no(qnaNo);

		// DB 조회
		QnaVo resultVo = QnaDAO.getInstance().qnaView(qnaNo);
		int hitup = QnaDAO.getInstance().upHit(vo);
		System.out.println("hitup: " + hitup);

		// 결과 저장
		request.getSession().setAttribute("view", resultVo);
		request.getSession().setAttribute("qnaNo", qnaNo);
		request.getSession().setAttribute("viewNo", resultVo.getQna_no());
		request.getSession().setAttribute("hit", hitup);
		request.getSession().setAttribute("admin", admin);
		request.getSession().setAttribute("loginId", loginId);
		// request.setAttribute("view", resultVo);

		request.getRequestDispatcher("membersQnaView.jsp").forward(request, response);

	}

}
