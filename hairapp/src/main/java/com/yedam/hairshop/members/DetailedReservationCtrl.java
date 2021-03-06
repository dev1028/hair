package com.yedam.hairshop.members;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.MembersReservationDAO;
import com.yedam.hairshop.model.MembersReservationVo;

public class DetailedReservationCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터
		MembersReservationVo memVo = new MembersReservationVo();
		String mdr_no = request.getParameter("mdr_no");
		//잘 안들어오는거 같음
		System.out.println("mdr_no:::::::" + mdr_no);
		memVo.setMdr_no(mdr_no);
		
		// DB 조회
		MembersReservationDAO dao = MembersReservationDAO.getInstance();
		MembersReservationVo resultVo = dao.drHairshop(memVo);
		MembersReservationVo resultVo2 = dao.drHairshop2(memVo);
		System.out.println("resultVo: " + resultVo);
		System.out.println("resultVo2: " + resultVo2);
		
		// 결과 저장
		request.setAttribute("list", resultVo);
		request.setAttribute("list2", resultVo2);

		// 페이지 이동
		request.getRequestDispatcher("DetailedReservation.jsp").forward(request, response);

	}

}
