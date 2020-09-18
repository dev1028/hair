package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairshopVo;


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
		HairshopVo hVo = (HairshopVo) request.getSession().getAttribute("login");
		dVo.setHs_no(hVo.getHs_no());
		int r = DesignerDAO.getInstance().simpleInsert(dVo);
		if (r == 0) {
			response.getWriter().append("<script>")
								.append("alert('오류');")
								.append("location.href='employeeList.do';")
								.append("</script>");
		} else {
			response.sendRedirect("employeeList.do");
		}
	}

}
