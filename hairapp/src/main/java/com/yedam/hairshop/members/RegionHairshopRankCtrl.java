package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairshopDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.SearchRankVo;

public class RegionHairshopRankCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RegionHairshopRankCtrl");
		
		HttpSession sess = request.getSession();
		String lat = (String) sess.getAttribute("lat");
		String lng = (String) sess.getAttribute("lng");
		
		if(lat != null && lng != null) {
			SearchRankVo vo = new SearchRankVo();
			vo.setLat(lat);
			vo.setLng(lng);
			List<HairshopVo> list = HairshopDAO.getInstance().selectListHairshopRank(vo);
			if(list.size() == 0) {
				System.out.println("검색된 랭크 리스트가 없습니다.");
				System.out.println(lat + "," + lng);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("regionHairshopRank.jsp").forward(request, response);
			
		}else {
			
		}
	}

}
