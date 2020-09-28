package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.EmailVo;

public class MembersJoinEmailCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//EmailVo emailVo = new EmailVo();
		//SandEmail sandEmail = new SandEmail();

		//emailVo.setReceiverName("rina");
		//emailVo.setReceiverMail("aem205@gmail.com");
		//emailVo.setTitle("제목");
		//emailVo.setContents("내용");
		//sandEmail.sand(emailVo);

		String mem_email = request.getParameter("mem_email");

		MembersDAO.getInstance().updateForAuth(mem_email);
		
		response.getWriter().append("<script>")
		.append("alert('인증완료되었습니다.');")
		.append("location.href='membersLogin.do';")
		.append("</script>");

	}

}
