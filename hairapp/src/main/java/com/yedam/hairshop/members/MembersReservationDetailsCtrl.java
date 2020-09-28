package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersReservationVo;


public class MembersReservationDetailsCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터

		// DB 조회
		MembersReservationDAO dao = new MembersReservationDAO();
		List<MembersReservationVo> list = dao.reservationAll();
		List<MembersReservationVo> list2 = dao.bookingAll();

		// 결과 저장
		request.setAttribute("list", list);
		request.setAttribute("booking", list2);
		
		// 페이지 이동
		request.getRequestDispatcher("membersReservationCheck.jsp").forward(request, response);
	}

}
