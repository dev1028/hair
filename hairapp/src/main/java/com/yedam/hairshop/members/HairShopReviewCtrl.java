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
		String hr_rate = request.getParameter("hr_rate");	//별점
		String hr_contents = request.getParameter("contents");	//내용
		
		HairShopReviewVo vo = new HairShopReviewVo();
		vo.setMdr_no(mdr_no);
		vo.setHr_rate(hr_rate);
		vo.setHr_contents(hr_contents);
		
		HairShopReviewDAO.getInstance().insertReview(vo);
		//HairShopReviewDAO()
	}

}
