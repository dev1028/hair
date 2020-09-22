package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersLoginCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("멤버로그인");
		
		// 파라미터 VO에 담기
		MembersVo membersVO = new MembersVo();
		membersVO.setMem_email(request.getParameter("loginid"));		// 파라미터는 name값 넘기는거
		membersVO.setMem_pw(request.getParameter("loginpw"));

		// 2. 서비스 처리(DB)
		MembersVo resultVO = MembersDAO.getInstance().loginSelectOne(membersVO); // memberVO 집어넣고 결과를 MemberVO로 받기
		request.getSession().setAttribute("login", resultVO);
//		request.getSession().setAttribute("loginid", resultVO.getMem_email()); // 세션아이디
//		request.getSession().setAttribute("loginpw", resultVO.getMem_pw());
		
		// 3. 결과 저장

		
		// 4. 뷰페이지 이동(redirect, forward) 또는 뷰페이지 출력
		request.getRequestDispatcher("/members/membersLogin.jsp").forward(request, response);

	}

}
