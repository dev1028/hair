package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;

public class RegionHairshopRankCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RegionHairshopRankCtrl");
		List<HairshopVo> list = HairshopDAO.getInstance().selectListHairshopRank(null);

		request.setAttribute("list", list);
		request.getRequestDispatcher("regionHairshopRank.jsp").forward(request, response);
	}

}
