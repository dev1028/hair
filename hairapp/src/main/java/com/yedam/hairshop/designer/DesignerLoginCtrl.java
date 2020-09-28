package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.members.Controller;
import com.yedam.hairshop.model.DesignerVo;

public class DesignerLoginCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DesignerVo designerVo = new DesignerVo();
		designerVo.setDesigner_email(request.getParameter("email"));
		designerVo.setDesigner_pw(request.getParameter("pw"));

		DesignerVo resultVo = DesignerDAO.getInstance().selectOneEmail(designerVo);

		// 3.결과 저장
		String page = "";
		if (resultVo == null) { // id 없음
			request.setAttribute("errormsg", "해당 email이 없습니다.");
			page = "/designer/designerLoginForm.jsp";

		} else {
			if (designerVo.getDesigner_pw().equals(resultVo.getDesigner_pw())) { // 로그인 성공
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("email", resultVo.getDesigner_email());

				// 로그인 후 인증확인
				if (resultVo.getDesigner_access_status().equals("1")) {
					page = "/designer/designerUpdate.jsp";
				}else if (resultVo.getDesigner_access_status().equals("0")) {
					page = "/designer/designerLoginStatus.jsp";
				} else {
					page = "/designer/designerLoginFail.jsp";
				}
				
			} else { // 패스워드 불일치
				request.setAttribute("errormsg", "pw 불일치");
				page = "/designer/designerLoginForm.jsp";
			}
		}

		// 4. 뷰페이지 이동(redirect,forward) 또는 뷰페이지 출력
		request.getRequestDispatcher(page).forward(request, response);
	}

}
