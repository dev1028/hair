package com.yedam.hairshop.members;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.hairshop.common.ChangeUtil;
import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.DesignerBookmarkDAO;
import com.yedam.hairshop.dao.DesignerDAO;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.DesignerBookmarkVo;
import com.yedam.hairshop.model.DesignerVo;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopBookmarkVo;
//import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersHairshopVo;
import com.yedam.hairshop.model.MembersVo;

public class DesignerSelectCtrl implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DesignerSelectCtrl");

//		String strDate = request.getParameter("date");
//		String strStartHour = request.getParameter("hs_starttime");
//		String strTotalHour = (String)request.getSession().getAttribute("total_hour");
		
		HttpSession session = request.getSession();
		HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
		session.setAttribute("hs_dayoff", hairshopVo.getHs_dayoff());
		
		DesignerVo vo = new DesignerVo();
		vo.setHs_no(hairshopVo.getHs_no());
		List<DesignerVo> list = DesignerDAO.getInstance().notRetireeByHairShop(vo);
		
		//북마크 세팅
		MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
		for(DesignerVo v : list) {
			if(memVo != null) {
				DesignerBookmarkVo bookVo = new DesignerBookmarkVo();
				bookVo.setDesigner_no(v.getDesigner_no());
				bookVo.setMem_no(memVo.getMem_no());
				
				//북마크 되어 있는 것이라면
				if(DesignerBookmarkDAO.getInstance().HasBookmark(bookVo)) {
					v.setDesigner_book("1");
				}
			}
			v.setDesigner_dayoff(ChangeUtil.changeDayOffNumToStr(v.getDesigner_dayoff()));
		}
		request.setAttribute("list", list);
		
		// 헤어샵 정보 뿌리는것들
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hairshopVo);
		HairShopReviewVo shop2 = MembersHairshopDAO.getInstance().reviewCount(hairshopVo);
		HairshopBookmarkVo shop3 = MembersHairshopDAO.getInstance().bookmarkCount(hairshopVo);
		request.setAttribute("shop", shop);
		request.setAttribute("shop2", shop2);
		request.setAttribute("shop3", shop3);

		
		
//		if(strDate != null && strStartHour != null && strTotalHour != null) {
//			request.getSession().setAttribute("date", strDate);
//			request.getSession().setAttribute("hour", strStartHour);
//			
//			Date date = null;
//			String dayOfWeek = null;
//			try {
//				date = new SimpleDateFormat("yyyy-MM-dd").parse(strDate);
//				System.out.println(date.toString());
//				dayOfWeek = new SimpleDateFormat("E").format(date);
//				System.out.println(dayOfWeek + "요일입니다.");
//				
//				HttpSession session = request.getSession();
//				HairshopVo hairshopVo = (HairshopVo) session.getAttribute("selHairshopVo");
//				
//				DesignerVo vo = new DesignerVo();
//				vo.setHs_no(hairshopVo.getHs_no());
//				List<DesignerVo> list = DesignerDAO.getInstance().notRetireeByHairShop(vo);
//
//				list = filterDayOff(list, dayOfWeek);
//				list = filterHour(list, Integer.parseInt(strStartHour), 
//										Integer.parseInt(strStartHour) + Integer.parseInt(strTotalHour));
//				
//				//월화수목금 휴일 필터링
//				
//				//북마크 세팅
//				MembersVo memVo = (MembersVo) request.getSession().getAttribute("login");
//				for(DesignerVo v : list) {
//					if(memVo != null) {
//						DesignerBookmarkVo bookVo = new DesignerBookmarkVo();
//						bookVo.setDesigner_no(v.getDesigner_no());
//						bookVo.setMem_no(memVo.getMem_no());
//						
//						//북마크 되어 있는 것이라면
//						if(DesignerBookmarkDAO.getInstance().HasBookmark(bookVo)) {
//							v.setDesigner_book("1");
//						}
//					}
//					v.setDesigner_dayoff(ChangeUtil.changeDayOffNumToStr(v.getDesigner_dayoff()));
//				}
//				
//				request.setAttribute("list", list);
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//		}else {
//			request.setAttribute("list", null);
//		}
		
		
		request.getRequestDispatcher("/members/designerSelect.jsp").forward(request, response);
	}
	
	
	List<DesignerVo> filterDayOff(List<DesignerVo> srcList, String dayOfWeek){
		List<DesignerVo> filterList = new ArrayList<DesignerVo>();
		for(DesignerVo vo : srcList) {
			String dayoff = vo.getDesigner_dayoff();
			if(dayoff != null) {
				String listDayOfWeek = ChangeUtil.changeDayOffNumToStr(dayoff);
				if(!listDayOfWeek.contains(dayOfWeek)) {
					filterList.add(vo);
				}
			}
		}
		return filterList;
	}
	
	List<DesignerVo> filterHour(List<DesignerVo> srcList, int startHour, int endHour){
		List<DesignerVo> filterList = new ArrayList<DesignerVo>();
		for(DesignerVo vo : srcList) {
			int work_start_time = Integer.parseInt(vo.getWork_start_time());
			int work_end_time = Integer.parseInt(vo.getWork_end_time());
			if(startHour >= work_start_time && startHour < work_end_time &&
			   endHour > work_start_time && endHour <= work_end_time) {
				filterList.add(vo);
			}
		}
		return filterList;
	}
}
