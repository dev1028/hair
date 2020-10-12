package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersReservationVo;


public class MembersReservationDetailsCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터
		String mem_no = request.getSession().getAttribute("memNo").toString();

		MembersReservationVo vo = new MembersReservationVo();
		vo.setMem_no(mem_no);

		// DB 조회
		MembersReservationDAO dao = new MembersReservationDAO();
		List<MembersReservationVo> list = dao.bookingAll(vo);			// 예약중인 헤어샵
		List<MembersReservationVo> list2 = dao.reservationAll(vo);		// 전체 예약내역
		System.out.println("list: "+ list);
		System.out.println("list2: "+ list2);

		// 결과 저장
		request.setAttribute("booking", list);
		request.setAttribute("list2", list2);
		
		// 페이지 이동
		request.getRequestDispatcher("membersReservationCheck.jsp").forward(request, response);
	}

}
