package com.yedam.hairshop.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.hairshop.common.Controller;
import com.yedam.hairshop.dao.SalesDAO;
import com.yedam.hairshop.model.SalesVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AdminSalesStatisticsFCtrl implements Controller {
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ArrayList<DesignerVo> dsList = SalesDAO.getInstance().getDsName();
			request.setAttribute("list", dsList);
			String startDate = request.getParameter("start");
			String endDate = request.getParameter("end");
			String ds = request.getParameter("ds");
			System.out.println(ds);
			//ArrayList<SalesVo> salesList = SalesDAO.getInstance().dailySalesAllAddDs(startDate, endDate,ds);
			ArrayList<SalesVo> salesList = SalesDAO.getInstance().dailySalesAll(startDate, endDate);
			int card = 0;
			int cash = 0;
			int kakao = 0;
			int account = 0;
			int total = 0;
			for (SalesVo vo : salesList) {
				card += Integer.parseInt(vo.getCard());
				kakao += Integer.parseInt(vo.getKakao());
				cash += Integer.parseInt(vo.getCash());
				account += Integer.parseInt(vo.getAccount());
				total += Integer.parseInt(vo.getTotalAmountRsv());

			}
			System.out.println("fctl" + startDate + endDate);

			request.setAttribute("salesResult", salesList);
			request.setAttribute("card", card);
			request.setAttribute("cash", cash);
			request.setAttribute("kakao", kakao);
			request.setAttribute("account", account);
			request.setAttribute("total", total);
			request.setAttribute("noc", salesList.size());
//			response.sendRedirect("");
			request.getRequestDispatcher("/hairshop/hairshopStatistics.jsp").forward(request, response);
		}

	}
