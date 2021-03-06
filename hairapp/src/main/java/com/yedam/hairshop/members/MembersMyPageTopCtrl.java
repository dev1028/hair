package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersReservationVo;

public class MembersMyPageTopCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터
		String mem_no = request.getSession().getAttribute("memNo").toString();
		
		MembersReservationVo vo = new MembersReservationVo();
		vo.setMem_no(mem_no);

		// DB 조회
		MembersReservationDAO dao = new MembersReservationDAO();
		List<MembersReservationVo> list = dao.bookingAll(vo);
		List<MembersReservationVo> list2 = dao.OnceVisitedHS(vo);

		// 결과 저장
		request.setAttribute("booking", list);
		request.setAttribute("onevisit", list2);

		// 페이지 이동
		request.getRequestDispatcher("membersMypageTop.jsp").forward(request, response);
	}

}
