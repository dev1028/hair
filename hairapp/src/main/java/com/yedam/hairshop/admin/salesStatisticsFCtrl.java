package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.SalesVo;

public class salesStatisticsFCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("start");
		String endDate = request.getParameter("end");
		String ds = request.getParameter("ds");
		ArrayList<SalesVo> list = SalesDAO.getInstance().period(startDate, endDate);
		SalesVo resultVo = new SalesVo();
		System.out.println("fctl");
		int sum = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCode().equals("d1")) {
				resultVo.setCard(list.get(i).getSum());
			} else if (list.get(i).getCode().equals("d2")) {
				resultVo.setCash(list.get(i).getSum());
			} else if (list.get(i).getCode().equals("d3")) {
				resultVo.setKakao(list.get(i).getSum());
			} else if (list.get(i).getCode().equals("d6")) {
				resultVo.setAccount(list.get(i).getSum());
			} else {

			}
			sum += list.get(i).getSum();
		}
		resultVo.setSum(sum);

		request.setAttribute("vo", resultVo);
//		response.sendRedirect("");
		request.getRequestDispatcher("/hairshop/hairshopStatistics.jsp").forward(request, response);
	}

}
