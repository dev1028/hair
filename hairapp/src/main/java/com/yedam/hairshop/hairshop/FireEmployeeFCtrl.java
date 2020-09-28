package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.yedam.hairshop.dao.DesignersLeaveInfoDAO;
import com.yedam.hairshop.members.Controller;
import com.yedam.hairshop.model.DesignersLeaveInfoVo;

public class FireEmployeeFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DesignersLeaveInfoVo dVo = new DesignersLeaveInfoVo();
		try {
			BeanUtils.copyProperties(dVo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		String hs_no = (String) request.getSession().getAttribute("hsno");
		dVo.setHs_no(hs_no);
		
		int r = DesignersLeaveInfoDAO.getInstance().fireDesigner(dVo);
		
		if (r == 0) {
			response.getWriter().append("<script>")
								.append("alert('직원등록에 실패하였습니다. 반복시 관리자에게 문의해주세요.');")
								.append("location.href='retiredEmployeeList.do';")
								.append("</script>");
		} else {
			response.sendRedirect("retiredEmployeeList.do");
		}
	}

}
