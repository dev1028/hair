package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class MembersQnaDCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnA삭제");
		
		String qnaNo = request.getSession().getAttribute("viewNo").toString();
		
		QnaVo vo = new QnaVo();
		String qna_no = qnaNo;
		
		vo.setQna_no(Integer.parseInt(qna_no));
		
		QnaDAO.getInstance().qnaDelete(vo);
		
		response.sendRedirect("membersQna.do");

	}

}
