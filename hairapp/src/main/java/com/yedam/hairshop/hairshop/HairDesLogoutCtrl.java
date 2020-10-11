package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;

public class HairDesLogoutCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate(); // 모든세션정보 삭제
		response.getWriter().append("<script>")
		.append("alert('로그아웃 되었습니다. 메인페이지로 이동합니다.');")
		.append("location.href='hairshopReturnToLogin.do';")
		.append("</script>");
	}

}
