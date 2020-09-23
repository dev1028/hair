package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.SandEmail;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.EmailVo;


public class EmployeeSimpleJoinFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DesignerVo dVo = new DesignerVo();
		try {
			BeanUtils.copyProperties(dVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String hs_no = (String) request.getSession().getAttribute("hsno");
		dVo.setHs_no(hs_no);
		int r = DesignerDAO.getInstance().simpleInsert(dVo);
		if (r == 0) {
			response.getWriter().append("<script>")
								.append("alert('직원등록에 실패하였습니다. 반복시 관리자에게 문의해주세요.');")
								.append("location.href='employeeList.do';")
								.append("</script>");
		} else {
			
			SandEmail se = new SandEmail();
			EmailVo em = new EmailVo();
			em.setReceiverMail(dVo.getDesigner_email());
			em.setReceiverName(dVo.getDesigner_name());
			em.setTitle("우동디자이너 인증요청");
			em.setContentType("text/html; charset=UTF-8");
			String contents = "<h3>디자이너 인증요청</h3>"
					+ "<a href='http://192.168.0.104/hairapp/hairshop/employeeAuth.do?designer_email="+dVo.getDesigner_email()+"'>인증완료</a>";
				
			em.setContents(contents);
			se.sand(em);
			response.sendRedirect("employeeList.do");
		}
	}

}
