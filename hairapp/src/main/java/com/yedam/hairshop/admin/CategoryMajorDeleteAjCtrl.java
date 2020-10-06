package com.yedam.hairshop.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CodeDAO;
import com.yedam.hairshop.model.CodeVo;

public class CategoryMajorDeleteAjCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CodeVo cVo = new CodeVo();
		cVo.setCode_no(request.getParameter("no"));
		int r = CodeDAO.getInstance().delete(cVo);
		response.getWriter().print(r);
	}

}
