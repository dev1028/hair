package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.MembersVo;
import com.yedam.hairshop.model.SearchRankVo;

public class RegionDesignerRankCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RegionDesignerRankCtrl");
		
		HttpSession sess = request.getSession();
		String lat = (String) sess.getAttribute("lat");
		String lng = (String) sess.getAttribute("lng");
		
		if(lat != null && lng != null) {
			SearchRankVo vo = new SearchRankVo();
			vo.setLat(lat);
			vo.setLng(lng);
			
			MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
			if(memVo != null){
				vo.setMem_no(memVo.getMem_no());
			}
			
			List<DesignerVo> list = DesignerDAO.getInstance().selectListDesignerRank(vo);
			request.setAttribute("list", list);
			request.getRequestDispatcher("regionDesignerRank.jsp").forward(request, response);
		}
	}

}
