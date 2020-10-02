package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;

public class RegionDesignerRankCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RegionDesignerRankCtrl");
		List<DesignerVo> list = DesignerDAO.getInstance().selectListDesignerRank(null);
		request.setAttribute("list", list);
		request.getRequestDispatcher("regionDesignerRank.jsp").forward(request, response);
	}

}
