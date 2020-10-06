package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminQnaViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String qna_no = request.getParameter("qna_no");
		BoardManageVo vo = new BoardManageVo ();
		vo.setQna_no(qna_no);
	vo	= BoardManageDAO.getInstance().qnaSelectOne(vo);
		request.setAttribute("vo", vo);
	//	vo.get
	request.getRequestDispatcher("/admin/adminQnaView.jsp").forward(request, response);
	}

}
