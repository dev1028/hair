package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

public class AdminTtCategoryRequestCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<TtCategoryVo> list = TtCategoryDAO.getInstance().selectListRequstTmic();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/ttCategoryRequest.jsp").forward(request, response);

	}

}
