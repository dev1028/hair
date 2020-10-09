package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersHairshopDAO;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersEventVo;
import com.yedam.hairshop.model.MembersHairshopVo;

public class MembersHsCouponICtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MembersHsCouponICtrl");
		
		// 헤어샵 정보 뿌리는 세트
		HairshopVo hsVo = (HairshopVo) request.getSession().getAttribute("selHairshopVo");
		
		MembersEventVo eventVo = new MembersEventVo();
		eventVo.setHs_no(hsVo.getHs_no());
		
		// 헤어샵 정보 뿌리는거
		MembersHairshopVo shop = MembersHairshopDAO.getInstance().selectOne(hsVo);
		// 헤어샵 정보 뿌리는 세트 여기까지
		
		// 파라미터 VO에 담기
		String hsc_no = request.getParameter("hsc_no");
		String hsc_coupon_quantity = request.getParameter("hsc_coupon_quantity");
		System.out.println("hsc_no : " +hsc_no);
		System.out.println("hsc_coupon_quantity : " +hsc_coupon_quantity);
		
		String mem_no = request.getSession().getAttribute("memNo").toString();
		eventVo.setHsc_no(hsc_no);
		eventVo.setMem_no(mem_no);
		eventVo.setHsc_coupon_quantity(hsc_coupon_quantity);
		System.out.println("나와라eventVo : "+ eventVo);
		
		// 결과 저장
		MembersHairshopDAO.getInstance().couponIssuance(eventVo);	// 회원이 쿠폰 발급받는거
		MembersEventVo resultVo = MembersHairshopDAO.getInstance().numOfCoupenUp(eventVo);	// 쿠폰 소모하게 업데이트 하는거
		System.out.println("Integer.parseInt(resultVo.getHsc_coupon_quantity() : "+ Integer.parseInt(resultVo.getHsc_coupon_quantity()));
		
		if(Integer.parseInt(resultVo.getHsc_coupon_quantity()) <= 0) {
			response.getWriter().append("<script>")
								.append("alert('쿠폰이 소진되었습니다');")
								.append("</script>");

			request.getRequestDispatcher("hsEventIntro.do").forward(request, response);
			
		} else {
			response.getWriter().append("<script>")
								.append("alert('쿠폰이 발급되었습니다');")
								.append("</script>");
		
			request.getRequestDispatcher("hsEventIntro.do").forward(request, response);
		}

	}

}
