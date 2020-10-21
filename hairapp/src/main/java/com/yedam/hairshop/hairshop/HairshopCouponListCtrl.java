package com.yedam.hairshop.hairshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.common.Paging;
import com.yedam.hairshop.dao.HairshopCouponDAO;
import com.yedam.hairshop.model.CouponVo;

public class HairshopCouponListCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("쿠폰리스트");
		String p = request.getParameter("p");
		
		//유효성 체크
		int page = 1;
		if(p != null) {
			page = Integer.parseInt(p);
		}
		
		//Paging
		Paging paging = new Paging();
		paging.setPageUnit(20); //default 10 
		paging.setPageSize(20); //페이지 번호수
		paging.setPage(page);
		
		CouponVo vo = new CouponVo();
		HairshopCouponDAO dao = new HairshopCouponDAO();
		
		paging.setTotalRecord(dao.count(vo));
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		//미용실 세션
		String s = (String)request.getSession().getAttribute("hsno");
		System.out.println("헤어샵번호" + s);
		
		vo.setHs_no((String)request.getSession().getAttribute("hsno"));
		ArrayList<CouponVo> list = HairshopCouponDAO.getInstance().selectAll(vo);
		System.out.println("쿠폰조회 페이징되나");
		request.setAttribute("list",list);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/hairshop/hairshopCouponList.jsp").forward(request, response);
	}
}
