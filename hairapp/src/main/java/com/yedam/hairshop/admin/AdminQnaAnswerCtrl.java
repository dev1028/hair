package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.BoardManageDAO;
import com.yedam.hairshop.model.BoardManageVo;

public class AdminQnaAnswerCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String qna_ref = request.getParameter("qna_no");
		String qna_title = request.getParameter("answer_title");
		String qna_contents = request.getParameter("answer_contents");
		String qna_who = request.getParameter("qna_who");
		String emp_no = request.getSession().getAttribute("empno").toString();
		BoardManageVo tempVo = new BoardManageVo();
		tempVo.setQna_no(qna_ref);
		tempVo = BoardManageDAO.getInstance().qnaSelectOne(tempVo);
		String lev = tempVo.getQna_level();
		String pos = tempVo.getQna_repos();
		System.out.println("no"+qna_ref);

		BoardManageVo vo = new BoardManageVo();

		// 답글중 가장 최근 답글이 위로 올라가게 처리한다.
		// 그러기 위해 답글의 순서인 seq를 1증가시킨다.
		vo.setQna_repos(pos);
		vo.setQna_ref(qna_ref);
	BoardManageDAO.getInstance().updateRePos(vo);
		vo.setQna_contents(qna_contents);
		vo.setQna_title(qna_title);
		vo.setQna_ref(qna_ref);
		vo.setQna_who(qna_who);
		vo.setEmp_no(emp_no);
		vo.setQna_level(lev + 1);
		vo.setQna_repos(pos + 1);

		// 답글중 가장 최근 답글이 위로 올라가게 처리한다.
		// 그러기 위해 답글의 순서인 seq를 1증가시킨다.

		BoardManageDAO.getInstance().insertAnswer(vo);
		

		request.getRequestDispatcher("/admin/adminQnaManage.do").forward(request, response);
		
		
	}

}
