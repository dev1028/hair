package com.yedam.hairshop.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class AdminQnaAnswerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		QnaVo vo = QnaDAO.getInstance().qnaView(qna_no);
		request.setAttribute("vo", vo);
		vo.get
		request.getRequestDispatcher("/admin/adminQnaView.jsp").forward(request, response);

	}

}
