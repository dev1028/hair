package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class MembersQnaMCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnA수정");
		
		String qnaNo = request.getSession().getAttribute("viewNo").toString();
		
		QnaVo vo = new QnaVo();
		
		String qna_no = qnaNo;
		String qna_category = request.getParameter("qna_category");
		String qna_title = request.getParameter("qna_title");
		String qna_contents = request.getParameter("qna_contents");
		String qna_openstatus = request.getParameter("qna_openstatus");
		
		vo.setQna_no(Integer.parseInt(qna_no));
		vo.setQna_category(qna_category);
		vo.setQna_title(qna_title);
		vo.setQna_contents(qna_contents);
		vo.setQna_openstatus(qna_openstatus);
		
		QnaDAO dao = new QnaDAO();
		dao.noticeModify(vo);
		
		response.sendRedirect("membersQnaV.do?qna_no="+qna_no);

	}

}
