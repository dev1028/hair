package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopQnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class hairshopQnaReGCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HairshopQnaDAO dao = HairshopQnaDAO.getInstance();
		int qna_no = Integer.parseInt(request.getParameter("num"));
		// 답글 작성 후 원래 페이지로 돌아가기 위해 페이지 번호가 필요하다.
		String pageNum = request.getParameter("page");

		QnaVo resultVo = dao.qnaView(qna_no);

		request.setAttribute("re", resultVo);
		request.setAttribute("page", pageNum);
		request.getRequestDispatcher("hairshopQnaReply.jsp").forward(request, response);
	}
}
