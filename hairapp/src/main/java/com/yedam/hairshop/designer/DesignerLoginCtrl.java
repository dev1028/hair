package com.yedam.hairshop.designer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;

public class DesignerLoginCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DesignerVo designerVo = new DesignerVo();
		designerVo.setDesigner_email(request.getParameter("email"));
		designerVo.setDesigner_pw(request.getParameter("pw"));
		designerVo.setDesigner_access_status(request.getParameter("status"));
		designerVo.setDesigner_no(request.getParameter("designer_no"));
		designerVo.setDesigner_name(request.getParameter("designer_name"));

		// test
		designerVo.setDesigner_phone(request.getParameter("designer_phone"));
		designerVo.setDesigner_dayoff(request.getParameter("designer_dayoff"));
		designerVo.setWork_start_time(request.getParameter("work_start_time"));
		designerVo.setWork_end_time(request.getParameter("work_end_time"));
		designerVo.setDesigner_profile(request.getParameter("designer_profile"));
		designerVo.setFile_name(request.getParameter("file_name"));

		DesignerVo resultVo = DesignerDAO.getInstance().selectOneEmail(designerVo);

		// 3.결과 저장
		String page = "";
		if (resultVo == null) { // id 없음
			request.setAttribute("errormsg", "해당 email이 없습니다.");
			page = "/hairshop/hairshopDesignerLogin.jsp";

		} else {
			if (designerVo.getDesigner_pw().equals(resultVo.getDesigner_pw())) { // 로그인 성공
				if (resultVo.getHs_no() != null) {
					request.getSession().setAttribute("login", resultVo);
					request.getSession().setAttribute("udong", "designer");
					request.getSession().setAttribute("email", resultVo.getDesigner_email());

					System.out.println("인증 :" + resultVo.getDesigner_access_status());
					// 로그인 후 인증확인
					// .do로 보낼땐 sendRedirect , forward로 보낼때 requestDispatcher
					if (resultVo.getDesigner_access_status().equals("1")) {
						request.getSession().setAttribute("designerNo", resultVo.getDesigner_no()); // 디자이너 번호 세션에 담기

						// 미용실정보 담기
						HairshopVo hSVo = new HairshopVo();
						hSVo.setHs_no(resultVo.getHs_no());
						hSVo = HairshopDAO.getInstance().selectOne(hSVo);
						request.getSession().setAttribute("hairshopInfo", hSVo);

						page = request.getContextPath() + "/designer/designerMain.do";
						response.sendRedirect(page);

					} else if (resultVo.getDesigner_access_status().equals("0")) {
						page = request.getContextPath() + "/designer/designerInfo.do";
						response.sendRedirect(page);

					} else {
						page = "/designer/designerLoginFail.jsp";
						request.getRequestDispatcher(page).forward(request, response);
					}
				} else {
					//퇴사한 직원
					request.setAttribute("errormsg", "퇴사한 직원입니다.");
					page = "/hairshop/hairshopDesignerLogin.jsp";
					request.getRequestDispatcher(page).forward(request, response);
				}
			} else { // 패스워드 불일치
				request.setAttribute("errormsg", "pw 불일치");
				page = "/hairshop/hairshopDesignerLogin.jsp";
				request.getRequestDispatcher(page).forward(request, response);
			}
		}

		// 4. 뷰페이지 이동(redirect,forward) 또는 뷰페이지 출력

	}

}
