package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairBookmarkDAO;
import com.yedam.hairshop.dao.HairshopHairInfoDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairBookmarkVo;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class MembersHairIntroCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HairshopVo hairshopVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		MembersVo loginVo = (MembersVo) request.getSession().getAttribute("login");
		HairshopHairInfoVo hairVo = new HairshopHairInfoVo();
		hairVo.setHs_no(hairshopVo.getHs_no());
//		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoList(hairVo);
//		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectHairInfoListWithFileName(hairVo);
//		if(list == null || list.size() == 0) {
//			System.out.println("list size is zero : " + hairVo.getHs_no());
//		}
//		
//		if(loginVo != null) {
//			for(HairshopHairInfoVo v : list) {
//				HairBookmarkVo tmpVo = new HairBookmarkVo();
//				tmpVo.setHhi_no(v.getHhi_no());
//				tmpVo.setMem_no(loginVo.getMem_no());
//				if(HairBookmarkDAO.getInstance().HasBookmark(tmpVo)) {
//					v.setHhi_book("1");
//				}
//			}
//		}
		
		List<HairshopHairInfoVo> list = HairshopHairInfoDAO.getInstance().selectListHairshopHairInfo_InHairshop(hairshopVo, "1");
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
		
		// 헤어샵 정보 뿌리는거
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hairshopVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(hairshopVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(hairshopVo);
		
		request.setAttribute("shop", shop);
		request.setAttribute("shop2", shop2);
		request.setAttribute("shop3", shop3);
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/members/hairIntro.jsp").forward(request, response);
	}

}
