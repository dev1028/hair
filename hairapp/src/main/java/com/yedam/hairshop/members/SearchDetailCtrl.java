package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.ArrayList;
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
		
		if(hs_starttime == null || hs_endtime == null || label == null)
			return;
		
		SearchDetailVo vo = new SearchDetailVo();
		vo.setLabel(label);
		vo.setHs_starttime(hs_starttime);
		vo.setHs_endtime(hs_endtime);

		List<HairshopVo> list = SearchDetailDAO.getInstance().selectListHairshop(vo);
		List<HairshopVo> realList = new ArrayList<HairshopVo>();
		for(HairshopVo v : list) {
			System.out.println(v.getHs_starttime());
			System.out.println(v.getHs_endtime());
			System.out.println(hs_starttime);
			System.out.println(hs_endtime);
			
			int st = Integer.parseInt(v.getHs_starttime());
			int ed = Integer.parseInt(v.getHs_endtime());
			if(st > ed) {
				ed += 12;
			}
			
			if(ed < Integer.parseInt(hs_starttime) || 
				st > Integer.parseInt(hs_endtime)) {
				
			}else {
				realList.add(v);
			}
		}
		request.setAttribute("list", realList);
		request.getRequestDispatcher("/members/hairshopSelect.jsp").forward(request, response);
		
	}
}
