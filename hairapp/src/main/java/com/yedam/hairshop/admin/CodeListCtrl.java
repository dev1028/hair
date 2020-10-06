package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.CodeDAO;
import com.yedam.hairshop.model.CodeVo;

import net.sf.json.JSONArray;

public class CodeListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isChoose = request.getParameter("isChoose");
		ArrayList<CodeVo> alist = null;
		if (isChoose == null || isChoose.equals("all")) {
			alist = CodeDAO.getInstance().selectAll();
		} else {
			CodeVo cVo = new CodeVo();
			cVo.setPrimary_code(isChoose);
			alist = CodeDAO.getInstance().selectByPrimaryCode(cVo);
		}
		request.setAttribute("alist", alist);
		
		if(request.getAttribute("plist") == null) {
			ArrayList<CodeVo> plist = CodeDAO.getInstance().primaryCodeDistinct();
			request.setAttribute("plist", plist);
			request.setAttribute("pplist", JSONArray.fromObject(plist));
		}
		
		request.getRequestDispatcher("/admin/adminCodeManage.jsp").forward(request, response);

	}

}
