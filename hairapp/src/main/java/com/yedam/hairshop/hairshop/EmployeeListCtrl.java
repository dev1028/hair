package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.ChangeUtil;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

import net.sf.json.JSONArray;

public class EmployeeListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직원관리 페이지로 가기전 미용실번호를 가져와야함
		if (request.getSession().getAttribute("hsno") == null) {
			response.getWriter().append("<script>")
			.append("alert('로그아웃 되었습니다. 다시 로그인 해주세요.');")
			.append("location.href='hairshopReturnToLogin.do';")
			.append("</script>");
		} else {
			String hs_no = (String) request.getSession().getAttribute("hsno");
			DesignerVo dVo = new DesignerVo();
			dVo.setHs_no(hs_no);
			ArrayList<DesignerVo> emplist = DesignerDAO.getInstance().selectByHairShop(dVo);
			for (DesignerVo emp : emplist) {
				if (emp.getDesigner_dayoff() == null) {
					emp.setDesigner_dayoff("-");
				} else {
					emp.setDesigner_dayoff(ChangeUtil.changeDayOffNumToStr(emp.getDesigner_dayoff()));
				}

				if (emp.getHire_date() == null) {
					emp.setHire_date("-");
				} else {
					String[] dateList = emp.getHire_date().trim().split(" ");
					emp.setHire_date(dateList[0]);
				}
			}
			request.setAttribute("emplistjson", JSONArray.fromObject(emplist));
			request.setAttribute("emplist", emplist);
			request.getRequestDispatcher("/hairshop/employeeList.jsp").forward(request, response);
		}
	}

}
