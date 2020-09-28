package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.EmailVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersPwSearchSCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwemail = request.getParameter("pwemail");
		String pwname = request.getParameter("pwname");
		String pwphone = request.getParameter("pwphone");
		System.out.println("뭐받아오노:" + pwemail + pwname + pwphone);

		MembersVo membersVo = new MembersVo();
		membersVo.setMem_email(pwemail);
		membersVo.setMem_name(pwname);
		membersVo.setMem_phone(pwphone);
		System.out.println("1:" + membersVo);

		MembersDAO dao = new MembersDAO();
		MembersVo resultVo = dao.findPw(membersVo); // 리턴값이 있는애는 resultVo가 있어야지 리턴이 가능함
		System.out.println("2:" + membersVo);

		request.setAttribute("members", resultVo);
		System.out.println("3:" + resultVo);

		//request.getRequestDispatcher("/members/memberPwS.jsp").forward(request, response);
		
		// 이메일
		SandEmail se = new SandEmail();
		EmailVo em = new EmailVo();
		System.out.println();
		em.setReceiverMail(resultVo.getMem_email());
		em.setReceiverName(resultVo.getMem_name());
		em.setTitle("우리동네 미용실 우동 비밀번호 인증 메일");
		em.setContentType("text/html; charset=UTF-8");
		String contents = "<h3>우리동네 미용실 우동</h3>"
				+ "<a href='http://192.168.0.57/hairapp/members/membersPwEmail.do?mem_email="+resultVo.getMem_email()+"'>누르시면 비밀번호 변경 페이지가 오픈됩니다.</a>";
		em.setContents(contents);
		se.sand(em);

		response.sendRedirect("membersPwEnd.do");

	}

}
