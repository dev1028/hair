package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.AdminMemberManageDAO;
import com.yedam.hairshop.model.BoardManageVo;
import com.yedam.hairshop.model.DesignerVo;

import net.sf.json.JSONArray;

public class AdminDesignerManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");
		BoardManageVo vo = new BoardManageVo();
		vo.setSearchInput(searchVal);
		vo.setSearchType(searchType);
		ArrayList<DesignerVo> list = AdminMemberManageDAO.getInstance().selectDs(null);
		request.setAttribute("list", list);
		request.setAttribute("jsonlist", JSONArray.fromObject(list));
		request.setAttribute("searchVal", searchVal);
		request.getRequestDispatcher("/admin/adminDesignerManage.jsp").forward(request, response);
	}

}
