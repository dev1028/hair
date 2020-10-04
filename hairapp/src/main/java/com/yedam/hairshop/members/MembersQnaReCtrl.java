package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.QnaDAO;
import com.yedam.hairshop.model.QnaVo;

public class MembersQnaReCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersQnaReCtrl");

		QnaDAO dao = QnaDAO.getInstance();
		QnaVo vo = new QnaVo();
		
		String memNo = request.getSession().getAttribute("memNo").toString();
		String loginId = request.getSession().getAttribute("loginid").toString();

		// 파리미터 값을 가져온다.
		String subject = request.getParameter("qna_title");
		String content = request.getParameter("qna_contents");
		String openstatus = request.getParameter("qna_openstatus");
		String category = request.getParameter("qna_category");
		int ref = Integer.parseInt(request.getParameter("qna_ref"));
		int lev = Integer.parseInt(request.getParameter("qna_level"));
		int pos = Integer.parseInt(request.getParameter("qna_repos"));
		

		// 답글중 가장 최근 답글이 위로 올라가게 처리한다.
		// 그러기 위해 답글의 순서인 seq를 1증가시킨다.
		vo.setQna_ref(ref);
		vo.setQna_repos(pos);
		dao.updateRePos(vo);

		// 답글 저장
		vo.setQna_no(dao.getSeq()); // 답글의 글번호는 시퀀스값 가져와 세팅
		vo.setQna_shop_customer_no(memNo);
		vo.setQna_writer(loginId);
		vo.setQna_title(subject);
		vo.setQna_contents(content);
		vo.setQna_openstatus(openstatus);
		vo.setQna_category(category);
		vo.setQna_ref(ref);
		vo.setQna_level(lev + 1);
		vo.setQna_repos(pos + 1);
		System.out.println("vo나와라: "+ vo);

		int result = dao.qnaInsert(vo);
		System.out.println("qna resultVo:" + result);
		
		response.sendRedirect("membersQna.do");

	}

}
