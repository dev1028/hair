package com.yedam.hairshop.hairshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class HairshopDesignerLoginCtrl implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// login
		// 1.파라미터 보에 담고
		HairshopVo hsVo = new HairshopVo();
		hsVo.setHs_email(request.getParameter("hs_email"));
		hsVo.setHs_pw(request.getParameter("hs_pw"));

		// 2.서비스 처리(db)
		// 싱글톤사용
		HairshopVo resultVo = HairshopDAO.getInstance().loginSelectOne(hsVo);

		// 3.결과저장
		String page = "";
		if (resultVo == null) { // 아이디 비번틀림
			response.getWriter().append("<script>").append("alert('아이디 또는 비밀번호가 틀렸습니다.');")
					.append("location.href='" + request.getContextPath() + "/ajax/hairshopReturnToLogin.do';")
					.append("</script>");
		} else {

			if (Integer.parseInt(resultVo.getHs_approval()) == 1) {
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("udong", "hairshop");
				request.getSession().setAttribute("hsno", resultVo.getHs_no());
				page = "/hairshop/hairshopMain.do";
				// 4.뷰페이지이동 포워드 리다이렉트 또는 뷰페이지 출력
				response.sendRedirect(request.getContextPath() + page);
			} else if (Integer.parseInt(resultVo.getHs_approval()) == 0) {
				response.getWriter().append("<script>").append("alert('관리자의 승인이 필요한 계정입니다.');")
						.append("location.href='" + request.getContextPath() + "/ajax/hairshopReturnToLogin.do';")
						.append("</script>");
			} else {
				response.getWriter().append("<script>").append("alert('이메일 인증이 필요한 계정입니다..');")
						.append("location.href='" + request.getContextPath() + "/ajax/hairshopReturnToLogin.do';")
						.append("</script>");
			}

		}

	}

}
