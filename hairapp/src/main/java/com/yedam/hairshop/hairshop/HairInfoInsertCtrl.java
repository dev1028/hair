package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

public class HairInfoInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<TtCategoryVo> list = TtCategoryDAO.getInstance().selectTmacAll();
		request.setAttribute("tmacList", list);
		request.getRequestDispatcher("/hairshop/hairInfoInsert.jsp").forward(request, response);
	}

}
