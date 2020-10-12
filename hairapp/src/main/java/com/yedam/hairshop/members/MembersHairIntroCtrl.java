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

public class MembersHairIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopVo hairshopVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		MembersVo loginVo = (MembersVo) request.getSession().getAttribute("login");
		HairshopHairInfoVo hairVo = new HairshopHairInfoVo();
		hairVo.setHs_no(hairshopVo.getHs_no());
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoList(hairVo);
		if(list == null || list.size() == 0) {
			System.out.println("list size is zero : " + hairVo.getHs_no());
		}
		
		if(loginVo != null) {
			for(HairshopHairInfoVo v : list) {
				HairBookmarkVo tmpVo = new HairBookmarkVo();
				tmpVo.setHhi_no(v.getHhi_no());
				tmpVo.setMem_no(loginVo.getMem_no());
				if(HairBookmarkDAO.getInstance().HasBookmark(tmpVo)) {
					v.setHhi_book("1");
				}
			}
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/members/hairIntro.jsp").forward(request, response);
	}

}
