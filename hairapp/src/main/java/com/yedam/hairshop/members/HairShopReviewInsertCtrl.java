package com.yedam.hairshop.members;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.HairShopReviewDAO;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.HairShopReviewVo;
import com.yedam.hairshop.model.HairshopHairInfoVo;
import com.yedam.hairshop.model.HairshopVo;
import com.yedam.hairshop.model.MembersReservationVo;

public class HairShopReviewInsertCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HairShopReviewInsertCtrl");
		String mdr_no = (String)request.getSession().getAttribute("mdr_no");
		String memName = (String)request.getSession().getAttribute("memName");
		System.out.println("mdr_no: " + mdr_no);
		
		if (mdr_no != null) {
			String hr_rate = request.getParameter("hr_rate");
			String hr_contents = request.getParameter("hr_contents");
			HairShopReviewVo vo = new HairShopReviewVo();
			MembersReservationVo reservationVo = MembersReservationDAO.getInstance()
								.selectReservationDetailInfo(mdr_no);
			String designer_no = reservationVo.getDesigner_no();
			String hs_no = reservationVo.getHs_no();
			System.out.println("designer_no: " + designer_no);
			System.out.println("hs_no: " + hs_no);
			if (designer_no != null && hs_no != null) {
				vo.setHr_rate(hr_rate);
				vo.setHr_contents(hr_contents);
				vo.setHs_no(hs_no);
				vo.setMdr_no(mdr_no);
				vo.setDesigner_no(designer_no);
				vo.setHr_writer(memName);
				
				if(HairShopReviewDAO.getInstance().selectReview(vo) == null)
					HairShopReviewDAO.getInstance().insertReview(vo);
				else
					HairShopReviewDAO.getInstance().updateReview(vo);
			}
		}
		request.getRequestDispatcher("/members/autuClose.jsp").forward(request, response);
	}

}
