package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

public class MembersPwEmailCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersPwEmailCtrl");
		String mem_email = request.getParameter("mem_email");
		String mem_pw = request.getParameter("mem_pw");
		request.getSession().setAttribute("mem_email", mem_email);
		
		
		MembersVo membersVo = new MembersVo();
		membersVo.setMem_email(mem_email);
		membersVo.setMem_pw(mem_pw);
		System.out.println("1:" + membersVo);

		MembersDAO dao = new MembersDAO();
		dao.updateForPw(membersVo);
		System.out.println("2:" + membersVo);
		
		request.getRequestDispatcher("membersPwModify.jsp").forward(request, response);
		
		//MembersDAO.getInstance().updateForAuth(mem_email);
		
//		response.getWriter().append("<script>")
//		.append("alert('인증완료되었습니다.');")
//		.append("location.href='membersLogin.do';")
//		.append("</script>");

	}

}
