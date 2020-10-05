package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairBookmarkDAO;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.model.HairBookmarkVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class HairSelectCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairSelectCtrl");
		
		HairshopVo vo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectListHairshopHairInfo_InHairshop(vo);
		request.setAttribute("list", list);
		
		
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		if(memVo != null) {
			HairBookmarkVo bookVo = new HairBookmarkVo();
			bookVo.setMem_no(memVo.getMem_no());
			
			for(HairshopHairInfoVo tmpVo : list) {
				bookVo.setHhi_no(tmpVo.getHhi_no());
				if(HairBookmarkDAO.getInstance().HasBookmark(bookVo))
					tmpVo.setHhi_book("1");
			}
		}
		request.getRequestDispatcher("/members/hairSelect.jsp").forward(request, response);
	}

}
