package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class MembersQnaMGCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersQnaMGCtrl");
		
		QnaVo vo = (QnaVo) request.getSession().getAttribute("view");
		System.out.println("qnaNo: " + vo);
		
		QnaVo resultVo = QnaDAO.getInstance().qnaModifyView(vo);
        
		request.getSession().setAttribute("qnaModify", resultVo);
		System.out.println("qnaModify: " + resultVo);
		
		request.getRequestDispatcher("/members/membersQnaModify.jsp").forward(request, response);
		
	}

}
