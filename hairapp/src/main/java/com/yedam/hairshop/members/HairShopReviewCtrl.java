package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairShopReviewDAO;
import com.yedam.hairshop.model.HairShopReviewVo;

public class HairShopReviewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mdr_no = request.getParameter("mdr_no");		//예약 번호
		HairShopReviewVo vo = new HairShopReviewVo();
		vo.setMdr_no(mdr_no);
		request.getSession().setAttribute("mdr_no", mdr_no);
		
		//이미 등록된 후기가 있다면 내용을 긁어와야 함.
		HairShopReviewVo reviewVo = HairShopReviewDAO.getInstance().selectReview(vo);
		if(reviewVo != null) {
			request.setAttribute("reviewVo", reviewVo);
		}
		
		request.getRequestDispatcher("/members/hairshopReview.jsp").forward(request, response);
	}

}
