package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersDAO;
import com.yedam.hairshop.model.MembersVo;

import net.sf.json.JSONArray;

public class AdminCustomerManageCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MembersVo> list = MembersDAO.getInstance().selectAll();
		request.setAttribute("list", list);
		request.setAttribute("jsonlist", JSONArray.fromObject(list));
		request.getRequestDispatcher("/admin/adminCustomerManage.jsp").forward(request, response);

	}

}
