package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SearchDetailDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.SearchDetailVo;

public class SearchDetailCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hs_starttime = request.getParameter("hs_starttime");
		String hs_endtime = request.getParameter("hs_endtime");
		String label = request.getParameter("term");
		
		SearchDetailVo vo = new SearchDetailVo();
		vo.setLabel(label);
		vo.setHs_starttime(hs_starttime);
		vo.setHs_endtime(hs_endtime);
		
		List<HairshopVo> list = SearchDetailDAO.getInstance().selectListHairshop(vo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/members/hairshopSelect.jsp").forward(request, response);
	}
}
