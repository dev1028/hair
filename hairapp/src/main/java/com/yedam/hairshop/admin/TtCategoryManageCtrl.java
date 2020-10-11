package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.TtCategoryDAO;
import com.yedam.hairshop.model.TtCategoryVo;

import net.sf.json.JSONArray;

public class TtCategoryManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<TtCategoryVo> ilist = TtCategoryDAO.getInstance().selectTmicAll();
		List<TtCategoryVo> alist = TtCategoryDAO.getInstance().selectTmacAll();
	
		
		request.setAttribute("ilist", ilist);
		request.setAttribute("alist", alist);
		request.setAttribute("alistjson", JSONArray.fromObject(alist));
		
		request.getRequestDispatcher("/admin/ttCategoryManage.jsp").forward(request, response);
	}

}
